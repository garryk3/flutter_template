import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationService extends Translations {
  static const locale = Locale('ru', 'RU');
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'ru_RU': {
          'err__app-init': 'Ошибка инициализации приложения',
          'sc__test__variants': 'Список вариантов теста',
          'sc__test__heading': 'Вопросы теста',
          'sc__tests_heading': 'Выбор теста',
          'sc__test-history__heading': 'История тестирования',
          'sc__test-home_btn': 'Начать тестирование',
          'side__heading': 'Меню',
        },
      };

  static String getLocaleName(String locale) {
    switch (locale) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Русский';
      default:
        return 'Unknown';
    }
  }

  static void changeLocale(String locale) async {
    final box = GetStorage();
    await box.write('locale', locale);
    Get.updateLocale(Locale(locale));
  }

  static Future<void> initLocale() async {
    final box = GetStorage();
    String locale = box.read('locale') ?? 'ru';
    Get.updateLocale(Locale(locale));
  }
}
