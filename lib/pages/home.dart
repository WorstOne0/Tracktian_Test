// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracktian_test/pages/assets/assets_tree_view.dart';
import 'package:tracktian_test/widgets/responsive/create_route.dart';
// Widget
import '/widgets/my_appbar.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, createRoute(const AssetsTreeView(), "assets_tree_view"));
            },
            child: const Row(
              children: [
                Text("Home"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
