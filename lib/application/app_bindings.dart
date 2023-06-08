import 'package:get/get.dart';

import 'package:psychology_tests/data/services/database.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DbService>(DbService(1));
  }
}
