import 'package:flutter/material.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/login.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/splash.dart';
import 'package:vhara_hobe_v1/src/repository/auth_repository/auth_repository.dart';
import 'package:vhara_hobe_v1/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'Name-here',
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value)=>Get.put(AuthRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: splash(),


    );
  }
}


