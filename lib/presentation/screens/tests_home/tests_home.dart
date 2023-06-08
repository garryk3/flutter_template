import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psychology_tests/infrastructure/router/router.dart';
import 'package:psychology_tests/presentation/widgets/buttons/buttons.dart';
import 'package:psychology_tests/presentation/widgets/layout/layout.dart';

class TestsStart extends StatelessWidget {
  const TestsStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      heading: 'sc__tests_heading'.tr,
      hasBackBtn: true,
      child: Center(
        child: Center(
          child: AppBtn(
            text: 'sc__test-home_btn'.tr,
            onPress: router.routeToTest,
          ),
        ),
      ),
    );
  }
}
