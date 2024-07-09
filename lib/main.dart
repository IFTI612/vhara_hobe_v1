import 'package:flutter/material.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/splash.dart';
import 'package:vhara_hobe_v1/src/repository/auth_repository/auth_repository.dart';
import 'package:vhara_hobe_v1/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    //name: 'VaraHobe',
    options: const FirebaseOptions(apiKey: "AIzaSyC8lR7_2FOHriN9i0PO_Qbx_PTowRJ9VwM",
        appId: "1:571688300079:android:0fbc402d408b536029e0da",
        messagingSenderId: "571688300079",
        projectId: "vara-hobe-v1"),
  ).then((value)=>Get.put(AuthRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      home: const splash(),


    );
  }
}


