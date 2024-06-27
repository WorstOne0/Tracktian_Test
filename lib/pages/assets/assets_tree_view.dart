// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_tree_view/animated_tree_view.dart';
// Controllers
import '/controllers/assets_controller.dart';
// Pages
import 'all_permission.dart';
// Widgets
import '/widgets/build_text_field.dart';
// Utils
import '/utils/string_extensions.dart';

class AssetsTreeView extends ConsumerStatefulWidget {
  const AssetsTreeView({super.key});

  @override
  ConsumerState<AssetsTreeView> createState() => _AssetsTreeViewState();
}

class _AssetsTreeViewState extends ConsumerState<AssetsTreeView> {
  // Tree Controllers
  final _autoController = AutoScrollController();
  //
  final _description = TextEditingController();
  bool isGlobal = false;

  final permisisonTree = TreeNode<({String label, bool? isSelected})>.root();

  List<String> finalPermissionsList = [];

  @override
  void initState() {
    super.initState();

    for (var permission in allPermisisonsList) {
      permisisonTree.add(buildPermisisonTree(permission));
    }

    for (var node in permisisonTree.childrenAsList) {
      correctCheckboxSelected(node as TreeNode<({String label, bool? isSelected})>);
    }

    _description.text = "Admin";
  }

  TreeNode<({String label, bool? isSelected})> buildPermisisonTree(
      Map<String, dynamic> permission) {
    final root = TreeNode<({String label, bool? isSelected})>(
      key: permission["value"].toString().replaceAll(".", "-"),
      data: (label: permission["label"].toString(), isSelected: null),
    );

    if (permission["children"] != null) {
      for (var children in permission["children"]) {
        root.add(buildPermisisonTree(children));
      }
    }

    if (permission["children"] == null) {
      root.data = (label: permission["label"].toString(), isSelected: false);
    }

    return root;
  }

  void correctCheckboxSelected(TreeNode<({String label, bool? isSelected})> node) {
    //
    node.children.forEach((key, value) {
      var childNode = value as TreeNode<({bool? isSelected, String label})>;

      correctCheckboxSelected(childNode);
    });

    changeParentCheckbox(node);
  }

  void changeChildCheckbox(TreeNode<({String label, bool? isSelected})> node, bool checkboxValue) {
    //
    node.children.forEach((key, value) {
      var childNode = value as TreeNode<({bool? isSelected, String label})>;

      childNode.data = (label: childNode.data?.label ?? "", isSelected: checkboxValue);

      changeChildCheckbox(childNode, checkboxValue);
    });
  }

  void changeParentCheckbox(TreeNode<({String label, bool? isSelected})> node) {
    if (node.isRoot) return;

    //
    var parentNode = node.parent as TreeNode<({String label, bool? isSelected})>;

    List<bool?> checkboxValues = [];

    parentNode.children.forEach((key, value) {
      var childNode = value as TreeNode<({bool? isSelected, String label})>;

      checkboxValues.add(childNode.data?.isSelected);
    });

    if (checkboxValues.every((element) => element == true)) {
      parentNode.data = (label: parentNode.data?.label ?? "", isSelected: true);
    } else if (checkboxValues.every((element) => element == false)) {
      parentNode.data = (label: parentNode.data?.label ?? "", isSelected: false);
    } else {
      parentNode.data = (label: parentNode.data?.label ?? "", isSelected: null);
    }

    changeParentCheckbox(parentNode);
  }

  void handleSubmit() async {
    finalPermissionsList.clear();

    Map<String, dynamic> permissionJson = {
      "descricao": _description.text,
      "global": isGlobal,
    };

    await Future.forEach(permisisonTree.childrenAsList, (node) {
      getPermissions(node as TreeNode<({String label, bool? isSelected})>);
    });

    permissionJson["permissoes"] = finalPermissionsList;
  }

  Future<void> getPermissions(TreeNode<({String label, bool? isSelected})> node) async {
    if (node.isLeaf && (node.data?.isSelected ?? false)) {
      return finalPermissionsList.add(node.key.replaceAll("-", "."));
    }

    await Future.forEach(node.childrenAsList, (childNode) {
      getPermissions(childNode as TreeNode<({String label, bool? isSelected})>);
    });
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            buildTextField(
              context,
              controller: _description,
              title: "Descrição",
              icon: Icons.description,
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
            Expanded(
              child: CustomScrollView(
                controller: _autoController,
                slivers: [
                  SliverTreeView.simpleTyped(
                    scrollController: _autoController,
                    tree: permisisonTree,
                    showRootNode: false,
                    expansionBehavior: ExpansionBehavior.collapseOthers,
                    expansionIndicatorBuilder: (context, node) => ChevronIndicator.rightDown(
                      tree: node,
                      alignment: Alignment.centerLeft,
                      // icon: Icons.arrow_right_rounded,
                      padding: const EdgeInsets.only(left: 10),
                      color: Colors.grey[700],
                    ),
                    onItemTap: (node) {
                      if (node.isLeaf) {
                        node.data = (
                          label: node.data?.label ?? "",
                          isSelected: !(node.data?.isSelected ?? false)
                        );

                        changeParentCheckbox(node);

                        setState(() {});
                      }
                    },
                    indentation: const Indentation(style: IndentStyle.squareJoint),
                    builder: (context, node) {
                      return Container(
                        padding: const EdgeInsets.only(left: 15),
                        // decoration: node.isExpanded
                        //     ? BoxDecoration(color: Colors.grey.withOpacity(0.07))
                        //     : null,
                        child: Row(
                          children: [
                            if (!node.isLeaf) const SizedBox(width: 25),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      (node.data?.label ?? "").tight(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: !node.isLeaf ? FontWeight.bold : null,
                                      ),
                                    ),
                                  ),
                                  Checkbox(
                                    value: node.data?.isSelected,
                                    tristate: !node.isLeaf,
                                    onChanged: (value) {
                                      if (!node.isLeaf) {
                                        bool checkboxValue = !(node.data?.isSelected ?? false);

                                        node.data = (
                                          label: node.data?.label ?? "",
                                          isSelected: checkboxValue,
                                        );

                                        changeChildCheckbox(node, checkboxValue);
                                        changeParentCheckbox(node);
                                      }

                                      if (node.isLeaf) {
                                        node.data =
                                            (label: node.data?.label ?? "", isSelected: value);

                                        changeParentCheckbox(node);
                                      }

                                      setState(() {});
                                    },
                                  ),
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
