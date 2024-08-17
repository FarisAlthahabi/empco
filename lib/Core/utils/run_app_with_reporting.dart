import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:empco/Core/bloc/Bloc_Observer.dart';
import 'package:empco/Core/repos/user_repo/user_repo.dart';
import 'package:empco/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> runAppWithReporting(
  Widget app, {
  required AsyncCallback preLaunch,
}) async {
  await runZonedGuarded(
    () async {
      UserRepo userRepo = UserRepo();
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await FirebaseMessaging.instance.setAutoInitEnabled(true);

      final fcmToken = await FirebaseMessaging.instance.getToken();
      print("FCMToken $fcmToken");
      await userRepo.setKey(fcmTokenRepo, fcmToken);

      await preLaunch();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      Bloc.observer = EmpcoBlocObserver();
      runApp(app);

//        String whatsappUrl = "https://wa.me/+963937866905";
// final Uri _url = Uri.parse(whatsappUrl);
//      if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
    },
    (error, stackTrace) {
      debugPrint('runAppWithReporting error: $error');
      debugPrint('runAppWithReporting stackTrace: $stackTrace');
    },
  );
}
