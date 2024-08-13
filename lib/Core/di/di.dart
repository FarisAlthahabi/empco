import 'package:empco/Core/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt config = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => config.init();
