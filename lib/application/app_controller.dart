import 'package:get/get.dart';
import 'package:psychology_tests/data/dao/dao.dart';
import 'package:psychology_tests/data/services/database.dart';

import 'package:psychology_tests/infrastructure/constants/constants.dart';
import 'package:psychology_tests/infrastructure/utils/utils.dart';

import 'theme.dart';

class AppController extends GetxController {
  LoadStatuses initStatus = LoadStatuses.loading;

  Future<void> connectDb() async {
    await Get.find<DbService>().initialize();
  }

  Future<void> saveStartTime() async {
    await SettingsDAO().saveLastOpenTime();
  }

  Future<void> initializeApp() async {
    try {
      Get.changeTheme(appTheme);
      await connectDb();
      await saveStartTime();
      initStatus = LoadStatuses.success;
      update();
    } catch (error) {
      logger.e(error.toString());
      initStatus = LoadStatuses.fail;
      update();
    }
  }

  @override
  void onReady() {
    super.onReady();
    initializeApp();
  }
}
