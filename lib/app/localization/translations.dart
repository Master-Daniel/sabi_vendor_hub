import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sabi_vendor_hub_mobile/app/constants/app_constants.dart';
import 'package:sabi_vendor_hub_mobile/app/utils/app_logger.dart';

// import 'ar.dart';
import 'en.dart';
// import 'fr.dart';

class AppTranslations {
  static Map<String, Map<String, String>> translationsKeys = {
    "en": englishTranslations,
    // "ar": arabicTranslations,
    // "fr": frenchTranslations,
  };

  /// Validates that all translation files have the same keys
static void validateTranslations() {
    final englishKeys = Set.from(translationsKeys["en"]?.keys ?? {});

    translationsKeys.forEach((language, translations) {
      if (language == "en") return; // Skip English as it's our reference

      final currentKeys = Set.from(translations.keys);

      // Find missing keys (in English but not in current language)
      final missingKeys = englishKeys.difference(currentKeys);
      if (missingKeys.isNotEmpty) {
        throw AssertionError(
            'Missing translations in $language:\n${missingKeys.join('\n')}');
      }

      // Find extra keys (in current language but not in English)
      final extraKeys = currentKeys.difference(englishKeys);
      if (extraKeys.isNotEmpty) {
        throw AssertionError(
            'Extra translations in $language:\n${extraKeys.join('\n')}');
      }

      // Validate that no translation is empty
      translations.forEach((key, value) {
        if (value.isEmpty) {
          throw AssertionError('Empty translation in $language for key: $key');
        }
      });
    });

    appLog("All translations validated successfully!");
  }

  static Locale? getDefaultLocal() {
    final box = GetStorage();
    String? lang = box.read(AppConstants.defaultLanguageKey);
    if (lang == null) {
      return Get.deviceLocale;
    }
    return Locale(lang);
  }

  static void changeLocale(String lang) {
    final box = GetStorage();
    box.write(AppConstants.defaultLanguageKey, lang);
    Get.updateLocale(Locale(lang));
  }
}
