import 'package:empco/Core/Localization/language_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin LanguageMixin<T extends StatefulWidget> on State<T> {
  late final LanguageChanger languageChanger = context.read();

  @override
  void initState() {
    super.initState();

    languageChanger.registerListener(onLanguageChanged);
  }

  void onLanguageChanged({
    required Locale oldLocale,
    required Locale newLocale,
  });
}
