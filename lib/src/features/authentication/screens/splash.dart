
import 'package:flutter/material.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/login.dart';
import 'package:vhara_hobe_v1/src/utils/theme/text_theme/text_theme.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState(){
    super.initState();
    _navigateHome();

  }

  _navigateHome()async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Vara Hobe",style:TextStyle(
          fontSize: 50,
          color: Colors.deepPurpleAccent,
          fontWeight: FontWeight.bold,
        ),


        ),

      ),
    );
  }
}