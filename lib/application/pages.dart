import 'package:get/get.dart';

import 'package:psychology_tests/infrastructure/constants/route_names.dart';
import 'package:psychology_tests/presentation/screens/test/test.dart';
import 'package:psychology_tests/presentation/screens/tests_history/tests_history.dart';
import 'package:psychology_tests/presentation/screens/tests_home/tests_home.dart';
import 'package:psychology_tests/presentation/widgets/route_view/route_view.dart';

final pages = [
  GetPage(
    name: RouteNames.tests.route(),
    page: () => const RouteView(child: TestsStart()),
  ),
  GetPage(
    name: RouteNames.testsHistory.route(),
    page: () => const RouteView(child: TestsHistory()),
  ),
  GetPage(
    name: RouteNames.test.route(),
    page: () => const RouteView(child: Test()),
  ),
];
