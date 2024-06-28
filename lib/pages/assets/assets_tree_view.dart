// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:tracktian_test/models/asset.dart';
import 'package:tracktian_test/models/location.dart';
import 'package:tracktian_test/widgets/response_widget.dart';
// Controllers
import '/controllers/assets_controller.dart';
// Pages
import 'all_permission.dart';
// Widgets
import '/widgets/build_text_field.dart';
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
  bool isLoading = true, isSuccess = false, isSearching = false;
  late ({bool success, String message}) response;

  // Tree Controllers
  final key = GlobalKey<SliverAnimatedListState>();
  final _autoController = AutoScrollController();
  final assetsTree = TreeNode<TreeView>.root();
  //
  final _searchController = TextEditingController();
  bool isGlobal = false;

  List<Location> locationList = [];
  List<Asset> assetList = [];

  @override
  void initState() {
    super.initState();

    // Too slow on really big trees (like on the company Apex)
    // _searchController.addListener(() {
    //   assetsTree.clear();
    //   buildPermisisonTree();

    //   setState(() {});
    // });

    asyncInit();
  }

  void asyncInit() async {
    var responses = await Future.wait([
      ref.read(assetsProvider.notifier).requestLocations(),
      ref.read(assetsProvider.notifier).requestAssets()
    ]);

    print("End of API");

    bool success = responses.every((element) => element.success);
    if (!success) response = responses.firstWhere((element) => !element.success);

    locationList = ref.read(assetsProvider).locationList;
    assetList = ref.read(assetsProvider).assetList;
    await buildPermisisonTree();

    setState(() {
      isLoading = false;
      isSuccess = success;
    });
  }

  Future<void> buildPermisisonTree() async {
    setState(() => isSearching = true);

    await Future.delayed(Duration(milliseconds: 50));

    // Build the Root of the Tree
    final locationRoot = [...locationList].where((location) => location.parentId == null).toList();
    final assetUnlinked = [...assetList]
        .where((asset) => asset.parentId == null && asset.locationId == null)
        .toList();

    List<TreeNode<TreeView>> nodes = [];
    // Locations in the Root
    for (var location in locationRoot) {
      var root = TreeNode<TreeView>(
        key: location.id,
        data: TreeView(location.name, TreeViewType.location, null, null),
      );

      var children = buildTreeChildren(location.id);
      root.addAll(children.node);

      print(location.name);
      if (location.name.contains(_searchController.text) || children.keepOnTree) {
        nodes.add(root);
        // assetsTree.add(root);
      }
    }

    // Unlinked Assets
    for (var asset in assetUnlinked) {
      var root = TreeNode<TreeView>(
        key: asset.id,
        data: TreeView(
          asset.name,
          asset.sensorType != null ? TreeViewType.component : TreeViewType.asset,
          asset.sensorType,
          asset.status == "alert",
        ),
      );

      if (asset.name.contains(_searchController.text)) {
        nodes.add(root);
        // assetsTree.add(root);
      }
    }

    setState(() => isSearching = false);
    await Future.delayed(Duration(milliseconds: 50));

    print("ADD ALL");
    assetsTree.addAll(nodes);
  }

  ({List<TreeNode<TreeView>> node, bool keepOnTree}) buildTreeChildren(String parentId) {
    final subLocation =
        [...locationList].where((location) => location.parentId == parentId).toList();
    final locationAssets = [...assetList].where((asset) => asset.locationId == parentId).toList();
    final assetsOfAssets = [...assetList].where((asset) => asset.parentId == parentId).toList();

    List<TreeNode<TreeView>> treeList = [];
    List<bool> subLocationBool = [], locationAssetsBool = [], assetsOfAssetsBool = [];

    // Location inside a Location
    for (var location in subLocation) {
      final root = TreeNode<TreeView>(
        key: location.id,
        data: TreeView(location.name, TreeViewType.location, null, null),
      );

      var children = buildTreeChildren(location.id);
      root.addAll(children.node);

      bool keepOnTree = children.keepOnTree || location.name.contains(_searchController.text);
      if (keepOnTree) treeList.add(root);
      subLocationBool.add(keepOnTree);
    }

    for (var asset in locationAssets) {
      final root = TreeNode<TreeView>(
        key: asset.id,
        data: TreeView(
          asset.name,
          asset.sensorType != null ? TreeViewType.component : TreeViewType.asset,
          asset.sensorType,
          asset.status == "alert",
        ),
      );

      var children = buildTreeChildren(asset.id);
      root.addAll(children.node);

      bool keepOnTree = children.keepOnTree || asset.name.contains(_searchController.text);
      if (keepOnTree) treeList.add(root);
      locationAssetsBool.add(keepOnTree);
    }

    for (var asset in assetsOfAssets) {
      final root = TreeNode<TreeView>(
        key: asset.id,
        data: TreeView(
          asset.name,
          asset.sensorType != null ? TreeViewType.component : TreeViewType.asset,
          asset.sensorType,
          asset.status == "alert",
        ),
      );

      var children = buildTreeChildren(asset.id);
      root.addAll(children.node);

      bool keepOnTree = children.keepOnTree || asset.name.contains(_searchController.text);
      if (keepOnTree) treeList.add(root);
      assetsOfAssetsBool.add(keepOnTree);
    }

    bool keepOnTree = subLocationBool.any((element) => element) ||
        locationAssetsBool.any((element) => element) ||
        assetsOfAssetsBool.any((element) => element);

    return (node: treeList, keepOnTree: keepOnTree);
  }

  void searchTree() async {
    assetsTree.clear();
    assetsTree.resetIndentationCache();
    await buildPermisisonTree();
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
        actions: const [Icon(Icons.lock), SizedBox(width: 20)],
      ),
      body: isLoading
          ? const Center(child: Text("Loading"))
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
                              title: "Search",
                              icon: Icons.description,
                            ),
                          ),
                          MaterialButton(
                            onPressed: searchTree,
                            color: Theme.of(context).colorScheme.primary,
                            child: const Icon(Icons.search),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Permissões",
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      isSearching
                          ? Center(
                              child: Text("Buscando"),
                            )
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
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          children: [
                                            if (!node.isLeaf) const SizedBox(width: 15),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(switch (node.data?.type) {
                                                    TreeViewType.location => Icons.location_on,
                                                    TreeViewType.asset => Icons.square,
                                                    TreeViewType.component => Icons.circle,
                                                    _ => Icons.error
                                                  }),
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
                                                    const Icon(Icons.energy_savings_leaf),
                                                  if (node.data?.isCritial ?? false)
                                                    const Icon(Icons.error)
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
