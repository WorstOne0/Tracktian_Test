// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_tree_view/animated_tree_view.dart';
// Controllers
import '/controllers/assets_controller.dart';
// Pages
import 'tree_view_isolate.dart';
// Widgets
import '/widgets/loading_shimmer.dart';
import '/widgets/build_text_field.dart';
import '/widgets/response_widget.dart';
// Utils
import '/utils/string_extensions.dart';

enum TreeViewType { asset, location, component }

class TreeView {
  late String label;
  late TreeViewType type;

  String? sensorType;
  bool? isCritial;

  TreeView(this.label, this.type, this.sensorType, this.isCritial);
}

class AssetsTreeView extends ConsumerStatefulWidget {
  const AssetsTreeView({super.key});

  @override
  ConsumerState<AssetsTreeView> createState() => _AssetsTreeViewState();
}

class _AssetsTreeViewState extends ConsumerState<AssetsTreeView> {
  //
  bool isLoading = true, isSuccess = false, isSearching = false;
  late ({bool success, String message}) response;

  // Tree Controllers
  final key = GlobalKey<SliverAnimatedListState>();
  final _autoController = AutoScrollController();
  TreeNode<TreeView> assetsTree = TreeNode<TreeView>.root();
  //
  final _searchController = TextEditingController();
  bool filterEnergy = false, filterCritical = false;

  @override
  void initState() {
    super.initState();

    asyncInit();
  }

  void asyncInit() async {
    var responses = await Future.wait([
      ref.read(assetsProvider.notifier).requestLocations(),
      ref.read(assetsProvider.notifier).requestAssets()
    ]);

    bool success = responses.every((element) => element.success);
    if (!success) response = responses.firstWhere((element) => !element.success);

    assetsTree = await createTreeViewIsolate(
      ref.read(assetsProvider).locationList,
      ref.read(assetsProvider).assetList,
      _searchController.text,
      filterEnergy,
      filterCritical,
    );

    setState(() {
      isLoading = false;
      isSuccess = success;
    });
  }

  void searchTree(bool newEnergy, bool newCritical) async {
    if (isSearching) return;

    setState(() {
      isSearching = true;
      filterEnergy = newEnergy;
      filterCritical = newCritical;
    });

    assetsTree = await createTreeViewIsolate(
      ref.read(assetsProvider).locationList,
      ref.read(assetsProvider).assetList,
      _searchController.text.toLowerCase(),
      filterEnergy,
      filterCritical,
    );

    setState(() => isSearching = false);
  }

  Widget buildLoading({bool showTop = true}) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              if (showTop) rectLoadingCard(120),
              if (showTop) const SizedBox(height: 15),
              ...List.generate(
                10,
                (index) => Column(children: [rectLoadingCard(60), const SizedBox(height: 15)]),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(assetsProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
        centerTitle: true,
        title: Text(
          "",
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [Icon(Icons.inventory), SizedBox(width: 20)],
      ),
      body: isLoading
          ? buildLoading()
          : !isSuccess
              ? ResponseWidget(
                  icon: Icons.error,
                  iconColor: Theme.of(context).colorScheme.error,
                  title: "Algo de Errado Aconteceu",
                  subtitle: response.message,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: buildTextField(
                              context,
                              controller: _searchController,
                              title: "Buscar Ativo ou Local",
                              icon: Icons.search,
                            ),
                          ),
                          MaterialButton(
                            height: 56,
                            onPressed: () => searchTree(filterEnergy, filterCritical),
                            color: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              "Buscar",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => searchTree(!filterEnergy, filterCritical),
                              child: Card(
                                elevation: 1,
                                color: filterEnergy
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).brightness == Brightness.light
                                        ? Colors.white
                                        : null,
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.energy_savings_leaf,
                                        size: 20,
                                        color: filterEnergy
                                            ? Colors.white
                                            : Theme.of(context).brightness == Brightness.light
                                                ? Colors.black
                                                : Colors.white,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Sensor de Energia",
                                        style: TextStyle(
                                          color: filterEnergy
                                              ? Colors.white
                                              : Theme.of(context).brightness == Brightness.light
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => searchTree(filterEnergy, !filterCritical),
                              child: Card(
                                elevation: 1,
                                color: filterCritical
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).brightness == Brightness.light
                                        ? Colors.white
                                        : null,
                                child: SizedBox(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        size: 20,
                                        color: filterCritical
                                            ? Colors.white
                                            : Theme.of(context).brightness == Brightness.light
                                                ? Colors.black
                                                : Colors.white,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Critico",
                                        style: TextStyle(
                                          color: filterCritical
                                              ? Colors.white
                                              : Theme.of(context).brightness == Brightness.light
                                                  ? Colors.black
                                                  : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Assets",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      isSearching
                          ? Expanded(child: buildLoading(showTop: false))
                          : Expanded(
                              child: CustomScrollView(
                                controller: _autoController,
                                slivers: [
                                  SliverTreeView.simpleTyped(
                                    key: key,
                                    scrollController: _autoController,
                                    tree: assetsTree,
                                    showRootNode: false,
                                    expansionBehavior: ExpansionBehavior.collapseOthers,
                                    expansionIndicatorBuilder: (context, node) =>
                                        ChevronIndicator.rightDown(
                                      tree: node,
                                      alignment: Alignment.centerLeft,
                                      // icon: Icons.arrow_right_rounded,
                                      padding: const EdgeInsets.only(left: 10),
                                      color: Colors.grey[700],
                                    ),
                                    indentation: const Indentation(style: IndentStyle.squareJoint),
                                    builder: (context, node) {
                                      return Container(
                                        height: 30,
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            if (node.level == 1 || !node.isLeaf)
                                              const SizedBox(width: 15),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    switch (node.data?.type) {
                                                      TreeViewType.location =>
                                                        "assets/drawable/location.png",
                                                      TreeViewType.asset =>
                                                        "assets/drawable/asset.png",
                                                      TreeViewType.component =>
                                                        "assets/drawable/component.png",
                                                      _ => "assets/drawable/location.png"
                                                    },
                                                    width: 20,
                                                    height: 20,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Expanded(
                                                    child: Text(
                                                      (node.data?.label ?? "").tight(),
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            !node.isLeaf ? FontWeight.bold : null,
                                                      ),
                                                    ),
                                                  ),
                                                  if (node.data?.sensorType == "energy")
                                                    const Icon(
                                                      Icons.energy_savings_leaf,
                                                      size: 16,
                                                      color: Colors.green,
                                                    ),
                                                  if (node.data?.isCritial ?? false)
                                                    const Icon(
                                                      Icons.error,
                                                      size: 16,
                                                      color: Colors.red,
                                                    )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                ),
    );
  }
}
