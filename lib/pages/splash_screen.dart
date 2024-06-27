// ignore_for_file: use_build_context_synchronously

// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tracktian_test/pages/home.dart';
// Widgets
import '/widgets/responsive/create_route.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    asyncInit();
  }

  void asyncInit() async {
    // Logo show duration
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      createRoute(const Home(), "offline_home.dart"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            Theme.of(context).brightness == Brightness.light
                ? "assets/drawable/ic_background_white.png"
                : "assets/drawable/ic_background_black.jpg",
          ),
          fit: BoxFit.cover,
        )),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset(
                  height: 180,
                  Theme.of(context).brightness == Brightness.light
                      ? "assets/drawable/ic_wiki_vert.png"
                      : "assets/drawable/ic_wiki_vert_white.png",
                ),
              ),
              const SizedBox(height: 60),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SOLUÇÕES ",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "INTELIGENTES",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "TELEMETRIA | RASTREAMENTO | GESTÃO DE SILOS",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
