import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:psychology_tests/application/app.dart';
import 'package:psychology_tests/infrastructure/constants/translations.dart';

void main() async {
  await GetStorage.init();
  await TranslationService.initLocale();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Application());
}
