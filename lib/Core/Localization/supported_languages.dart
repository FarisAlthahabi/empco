import 'package:equatable/equatable.dart';

abstract class SupportedLanguages {
  static const english = LanguageModel('English', 'en');
  static const list = [english];
}

class LanguageModel with EquatableMixin {
  const LanguageModel(this.name, this.code);

  final String name;
  final String code;

  @override
  List<Object?> get props => [code];
}
