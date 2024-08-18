import 'package:flutter/material.dart';
import 'package:to_do/app/core/values/enums/language_type_enum.dart';

///region const translation
const String arabic = 'ar';
const String english = 'en';
const String assetPathLocalization = 'assets/translations';
const Locale arabicLocal = Locale("ar", "SA");
const Locale englishLocal = Locale("en", "US");

///endRegion const translation

/// Change language by type
extension LanguageTypeExtention on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
