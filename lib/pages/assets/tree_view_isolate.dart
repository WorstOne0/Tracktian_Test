// Flutter packages
import 'package:flutter/foundation.dart';
import 'package:animated_tree_view/tree_view/tree_node.dart';
// Pages
import '/pages/assets/assets_tree_view.dart';
// Models
import '/models/asset.dart';
import '/models/location.dart';

class TreeViewIsolate {
  late List<Location> locationList;
  late List<Asset> assetList;

  late String search;
  late bool filterEnergy;
  late bool filterCritical;

  TreeViewIsolate(
      this.locationList, this.assetList, this.search, this.filterEnergy, this.filterCritical);
}

Future<TreeNode<TreeView>> createTreeViewIsolate(
  List<Location> locationList,
  List<Asset> assetList,
  String search,
  bool filterEnergy,
  bool filterCritical,
) async {
  //
  final assetsTree = await compute<TreeViewIsolate, TreeNode<TreeView>>(
    buildPermisisonTree,
    TreeViewIsolate(locationList, assetList, search, filterEnergy, filterCritical),
  );

  return assetsTree;
}

TreeNode<TreeView> buildPermisisonTree(TreeViewIsolate data) {
  List<Location> locationList = data.locationList;
  List<Asset> assetList = data.assetList;
  String search = data.search;

  final assetsTree = TreeNode<TreeView>.root();

  // Build the Root of the Tree
  final locationRoot = [...locationList].where((location) => location.parentId == null).toList();
  final assetUnlinked =
      [...assetList].where((asset) => asset.parentId == null && asset.locationId == null).toList();

  List<TreeNode<TreeView>> nodes = [];
  // Locations in the Root
  for (var location in locationRoot) {
    var root = TreeNode<TreeView>(
      key: location.id,
      data: TreeView(location.name, TreeViewType.location, null, null),
    );

    var children = buildTreeChildren(
      locationList,
      assetList,
      search,
      location.id,
      data.filterEnergy,
      data.filterCritical,
    );
    root.addAll(children.node);

    if (location.name.toLowerCase().contains(search) || children.keepOnTree) {
      if (data.filterEnergy || data.filterCritical) {
        if (children.keepOnTree) {
          nodes.add(root);
        }
      } else {
        nodes.add(root);
      }
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

    if (asset.name.toLowerCase().contains(search)) {
      if (data.filterEnergy && data.filterCritical) {
        if (asset.sensorType == "energy" && asset.status == "alert") nodes.add(root);
      } else if (data.filterEnergy) {
        if (asset.sensorType == "energy") nodes.add(root);
      } else if (data.filterCritical) {
        if (asset.status == "alert") nodes.add(root);
      } else {
        nodes.add(root);
      }
    }
  }

  assetsTree.addAll(nodes);
  return assetsTree;
}

({List<TreeNode<TreeView>> node, bool keepOnTree}) buildTreeChildren(
  List<Location> locationList,
  List<Asset> assetList,
  String search,
  String parentId,
  bool filterEnergy,
  bool filterCritical,
) {
  final subLocation = [...locationList].where((location) => location.parentId == parentId).toList();
  final locationAssets = [...assetList].where((asset) => asset.locationId == parentId).toList();
  final assetsOfAssets = [...assetList].where((asset) => asset.parentId == parentId).toList();

  List<TreeNode<TreeView>> treeList = [];
  bool keepOn = false;

  // Location inside a Location
  for (var location in subLocation) {
    final root = TreeNode<TreeView>(
      key: location.id,
      data: TreeView(location.name, TreeViewType.location, null, null),
    );

    var children = buildTreeChildren(
        locationList, assetList, search, location.id, filterEnergy, filterCritical);
    root.addAll(children.node);

    bool keepOnTree = children.keepOnTree || location.name.toLowerCase().contains(search);
    if (keepOnTree) {
      if (filterEnergy || filterCritical) {
        if (children.keepOnTree) {
          treeList.add(root);
          keepOn = true;
        }
      } else {
        treeList.add(root);
        keepOn = true;
      }
    }
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

    var children =
        buildTreeChildren(locationList, assetList, search, asset.id, filterEnergy, filterCritical);
    root.addAll(children.node);

    bool keepOnTree = children.keepOnTree || asset.name.toLowerCase().contains(search);
    if (keepOnTree) {
      if (filterEnergy && filterCritical) {
        if (asset.sensorType == "energy" && asset.status == "alert") {
          treeList.add(root);
          keepOn = true;
        }
      } else if (filterEnergy && !children.keepOnTree) {
        if (asset.sensorType == "energy") {
          treeList.add(root);
          keepOn = true;
        }
      } else if (filterCritical && !children.keepOnTree) {
        if (asset.status == "alert") {
          treeList.add(root);
          keepOn = true;
        }
      } else {
        treeList.add(root);
        keepOn = true;
      }
    }
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

    var children =
        buildTreeChildren(locationList, assetList, search, asset.id, filterEnergy, filterCritical);
    root.addAll(children.node);

    bool keepOnTree = children.keepOnTree || asset.name.toLowerCase().contains(search);
    if (keepOnTree) {
      if (filterEnergy && filterCritical) {
        if (asset.sensorType == "energy" && asset.status == "alert") {
          treeList.add(root);
          keepOn = true;
        }
      } else if (filterEnergy && !children.keepOnTree) {
        if (asset.sensorType == "energy") {
          treeList.add(root);
          keepOn = true;
        }
      } else if (filterCritical && !children.keepOnTree) {
        if (asset.status == "alert") {
          treeList.add(root);
          keepOn = true;
        }
      } else {
        treeList.add(root);
        keepOn = true;
      }
    }
  }

  return (node: treeList, keepOnTree: keepOn);
}
