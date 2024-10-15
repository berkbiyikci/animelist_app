import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationService {
  static const path = 'assets/languages';
  static List<Locale> get supportedLanguages => _supportedLanguages;
  static List<Locale> _supportedLanguages = [];

  LocalizationService.initialize(List<Locale> locales) {
    _supportedLanguages = locales;
  }
}