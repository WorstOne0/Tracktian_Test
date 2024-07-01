// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:responsive_framework/responsive_framework.dart';
// Pages
import '/pages/splash_screen.dart';
// Services
import '/services/secure_storage.dart';
// Styles
import '/styles/style_config.dart';
// Widget
import '/widgets/responsive/reponsive_widget.dart';

void main() async {
  // Flutter initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Enviroment Variables - https://pub.dev/packages/flutter_config
  await FlutterConfig.loadEnvVariables();

  // *** RIVERPOD ***
  // Startup (https://codewithandrea.com/articles/riverpod-initialize-listener-app-startup/)
  // 1. Create a ProviderContainer
  final container = ProviderContainer(observers: []);
  // 2. Use it to read the provider
  bool isDark = await container.read(secureStorageProvider).readString("dark_mode") == "true";

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(isDark: isDark),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({required this.isDark, super.key});

  final bool isDark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Theme Provider - Package for the animate the switching between themes (https://pub.dev/packages/animated_theme_switcher)
    return ThemeProvider(
      initTheme: isDark ? dark() : light(),
      duration: const Duration(milliseconds: 500),
      builder: (_, theme) => GetMaterialApp(
        title: 'Tractian Test',
        debugShowCheckedModeBanner: false,
        theme: theme,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 500, name: MOBILE),
            const Breakpoint(start: 501, end: 1024, name: TABLET),
            const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        ),
        // Always start at Splash Screen
        home: const ResponsiveWidget(child: SplashScreen()),
        // Support PT-BR in dates
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [Locale('pt', 'BR')],
      ),
    );
  }
}
