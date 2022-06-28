import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'src/helpers/orientation_helper.dart';
import 'src/injection/injection.dart';
import 'src/module/app_module.dart';

import 'src/app.dart';
import 'src/helpers/firebase_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  await initDependencyInjection();
  FirebaseHelper.initFirebaseMessaging();
  await OrientationHelper.setPreferredOrientation();
  await Modular.isModuleReady<AppModule>();

  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}
