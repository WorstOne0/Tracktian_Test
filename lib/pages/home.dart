// Flutter packages
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracktian_test/controllers/company_controller.dart';
import 'package:tracktian_test/models/company.dart';
import 'package:tracktian_test/pages/assets/assets_tree_view.dart';
import 'package:tracktian_test/widgets/response_widget.dart';
import 'package:tracktian_test/widgets/responsive/create_route.dart';
// Widget
import '/widgets/my_appbar.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  bool isLoading = true, isSuccess = false;
  late ({bool success, String message}) response;

  @override
  void initState() {
    super.initState();

    asyncInit();
  }

  void asyncInit() async {
    response = await ref.read(companyProvider.notifier).requestCompanies();

    setState(() {
      isLoading = false;
      isSuccess = response.success;
    });
  }

  Widget buildCompanyCard(Company company) {
    return GestureDetector(
      onTap: () {
        ref.read(companyProvider.notifier).selectCompany(company);

        Navigator.push(
          context,
          createRoute(const AssetsTreeView(), "assets_tree_view"),
        );
      },
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            children: [
              const Icon(Icons.inventory),
              const SizedBox(width: 10),
              Text(
                company.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(companyProvider);

    List<Company> companyList = ref.watch(companyProvider).companyList;

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: MyAppBar(),
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
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Empresas",
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${companyList.length}",
                                style: const TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            ...companyList.map((company) => buildCompanyCard(company)),
                          ],
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
