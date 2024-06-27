// Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Widgets
import '/widgets/my_cached_network_image.dart';

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
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/drawable/ic_wiki_logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Empresa",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Icon(FontAwesomeIcons.sort, size: 18)
          ],
        ),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCachedNetworkImage(
                imageUrl: "",
                defaultPlaceholderRadius: 20,
                errorWidget: CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      Image.asset("assets/drawable/ic_profile_avatar_other.png").image,
                ),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 20,
                  backgroundImage: imageProvider,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
