import 'package:get/get.dart';
import 'package:psychology_tests/infrastructure/constants/route_names.dart';

import 'package:psychology_tests/infrastructure/utils/utils.dart';

class _AppRouter {
  Future<dynamic>? routeToNamed(String routeName) {
    return Get.toNamed(routeName);
  }

  Future<dynamic>? routeToNamedAndOffCurrent(String routeName) {
    return Get.offNamed(routeName);
  }

  void goBack() {
    return Get.back();
  }

  Future<dynamic>? routeToHome() {
    return routeToNamed(RouteNames.tests.route());
  }

  Future<dynamic>? routeOffToHome() {
    return Get.offNamed(RouteNames.tests.route());
  }

  Future<dynamic>? routeToTest() {
    return routeToNamed(RouteNames.test.route());
  }

  void onChangeRoute(Routing? routing) {
    if (routing?.current == '/') {}
    logger.i('change $routing');
  }
}

final router = _AppRouter();
