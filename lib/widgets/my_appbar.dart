// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// Services
import '/services/secure_storage.dart';
// Styles
import '/styles/style_config.dart';

class MyAppBar extends ConsumerStatefulWidget {
  const MyAppBar({super.key});

  @override
  ConsumerState<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends ConsumerState<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Container(
        height: kToolbarHeight,
        alignment: Alignment.centerLeft,
        child: Image.asset(
          "assets/drawable/tractian_logo_full.png",
          fit: BoxFit.contain,
          height: 20,
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThemeSwitcher.withTheme(
                builder: (p0, switcher, theme) => IconButton(
                  onPressed: () {
                    ref.read(secureStorageProvider).saveString(
                          "dark_mode",
                          (theme.brightness == Brightness.light).toString(),
                        );

                    switcher.changeTheme(
                      theme: theme.brightness == Brightness.light ? dark() : light(),
                    );
                  },
                  icon: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      theme.brightness == Brightness.light ? Icons.dark_mode : Icons.light_mode,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
