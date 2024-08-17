import 'package:empco/Core/Localization/supported_languages.dart';
import 'package:empco/Core/Localization/translations.i18n.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LanguageChanger {
  @factoryMethod
  factory LanguageChanger() {
    return _instance ??= LanguageChanger._();
  }
  LanguageChanger._() {
    _observeChanges();
  }

  static LanguageChanger? _instance;

  static String languageKey = 'language key';

  static String setLanguageKey = 'set language';

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    await getLanguage();
    //await MyI18n.loadTranslations();
  }

  static bool isLanguage(LanguageModel language) {
    return I18n.language == language.code;
  }

  String? _language;

  String get language => _language ?? SupportedLanguages.english.code;

  final List<LanguageChanged> listeners = [];

  Future<bool> setLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString(languageKey, language);

    if (result) _language = language;
    return result;
  }

  Future<String> getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString(languageKey);

    language ??= SupportedLanguages.english.code;
    return _language = language;
  }

  String convertLanguageCodeToName(String language) {
    if (SupportedLanguages.english.code == language) {
      return SupportedLanguages.english.name;
    }
    throw Exception("Language name isn't found");
  }

  void registerListener(LanguageChanged newListener) {
    listeners.add(newListener);
    _observeChanges();
  }

  void _observeChanges() {
    I18n.observeLocale =
        ({required Locale oldLocale, required Locale newLocale}) {
      for (final oneListener in listeners) {
        oneListener(oldLocale: oldLocale, newLocale: newLocale);
      }
    };
  }
}

typedef LanguageChanged = void Function({
  required Locale oldLocale,
  required Locale newLocale,
});
