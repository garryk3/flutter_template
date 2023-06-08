import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psychology_tests/infrastructure/constants/constants.dart';
import 'package:psychology_tests/infrastructure/router/router.dart';
import 'package:psychology_tests/presentation/screens/tests_home/tests_home.dart';
import 'package:psychology_tests/presentation/widgets/route_view/route_view.dart';
import 'package:psychology_tests/presentation/widgets/typography/typography.dart';

import 'app_bindings.dart';
import 'app_controller.dart';
import 'pages.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.background;
    return GetMaterialApp(
      title: 'Psycho',
      debugShowCheckedModeBanner: false,
      getPages: pages,
      initialBinding: AppBinding(),
      defaultTransition: Transition.cupertino,
      translations: TranslationService(),
      locale: const Locale('ru', 'RU'),
      fallbackLocale: const Locale('en', 'UK'),
      home: GetBuilder<AppController>(
        init: AppController(),
        builder: (controller) {
          if (controller.initStatus == LoadStatuses.fail) {
            return Container(
              color: bgColor,
              child: Center(
                child: TypoText(text: 'err__app-init'.tr),
              ),
            );
          }
          if (controller.initStatus == LoadStatuses.success) {
            return const RouteView(child: TestsStart());
          }
          return Container(
            color: bgColor,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      routingCallback: router.onChangeRoute,
    );
  }
}
