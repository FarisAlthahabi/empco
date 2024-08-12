import 'package:empco/Core/Config/di/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt config = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => config.init();

// setup() async {
//   config.registerSingleton(await SharedPreferences.getInstance());

//   config.registerFactory(() => AuthBloc(),);
// }