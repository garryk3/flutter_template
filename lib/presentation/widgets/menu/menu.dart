import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:psychology_tests/infrastructure/constants/route_names.dart';
import 'package:psychology_tests/infrastructure/router/router.dart';

class _MenuItem {
  final String title;
  final RouteNames to;
  const _MenuItem(this.title, this.to);
}

List<_MenuItem> _menuData = [
  _MenuItem('sc__tests_heading'.tr, RouteNames.tests),
  _MenuItem('sc__test-history__heading'.tr, RouteNames.testsHistory),
];

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(bottom: 80.0),
          children: <Widget>[
            SizedBox(
              height: 80.0,
              child: DrawerHeader(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'side__heading'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.menu_book,
                      color: Colors.white.withOpacity(0.4),
                      size: 36.0,
                    )
                  ],
                ),
              ),
            ),
            for (_MenuItem item in _menuData)
              ListTile(
                title: Text(item.title),
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  router.routeToNamed(item.to.route());
                },
              ),
          ],
        ),
      ],
    );
  }
}
