import 'package:get/get.dart';

import 'package:psychology_tests/data/services/database.dart';
import 'package:psychology_tests/infrastructure/constants/tables.dart';

class SettingsDAO {
  final DbService _dbService = Get.find<DbService>();

  SettingsDAO();

  Future<void> saveLastOpenTime() async {
    await _dbService.insert(Tables.settings.name, {
      'startTime': DateTime.now().toIso8601String(),
    });
  }
}
