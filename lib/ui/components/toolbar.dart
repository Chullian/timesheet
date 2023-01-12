import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class AppToolbar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  AppToolbar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 8.0,
        top: 50.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.router.pop();
              },
              child: SvgPicture.asset(
                "assets/icons/arrow_back.svg",
                height: 15,
                width: 10,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title ?? "",
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}

PreferredSizeWidget Toolbar(
    {String title = "", String leadingAsset = "", Function? onLeadinClicked}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
        color: Color.fromRGBO(0, 0, 0, 1),
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
    ),
    leading: (leadingAsset.isEmpty)
        ? const SizedBox(
            height: 0,
          )
        : IconButton(
            onPressed: () => {
                  if (onLeadinClicked != null) {onLeadinClicked()}
                },
            icon: SvgPicture.asset(leadingAsset)),
  );
}
