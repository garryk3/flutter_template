import 'package:flutter/material.dart';

import 'package:psychology_tests/presentation/widgets/app_bar/app_bar.dart';
import 'package:psychology_tests/presentation/widgets/menu/menu.dart';

class RouteView extends StatelessWidget {
  final Widget child;

  const RouteView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TopAppBar(),
        drawer: const Drawer(
          child: Menu(),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          child: child,
        ),
      ),
    );
  }
}
