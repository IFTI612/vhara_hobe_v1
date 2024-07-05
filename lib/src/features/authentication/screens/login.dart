import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/home_page.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/reg.dart';

import '../controllers/loginC.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _obscureText = true;
  final c = Get.put(loginC());

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyanAccent,
              Colors.limeAccent,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              right: -20,
              child: Image.asset("assets/images/Test.png",
                fit: BoxFit.cover,
                scale: 2,
                opacity: AlwaysStoppedAnimation(0.9),
              ),
            ),
            _page(),
          ],
        ),

      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              const SizedBox(height: 60),
              _inputFieldEmail("Email", Get.find<loginC>().email),
              const SizedBox(height: 15),
              _inputFieldPassword("Password", Get.find<loginC>().pass),
              const SizedBox(height: 25),
              Row(
                children: [
                  SizedBox(width: 70),
                  _loginBtn(),
                  SizedBox(width: 37),
                  _regButton(),
                ],
              ),
              const SizedBox(height: 25),
              _extrText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      child: const Icon(
        Icons.account_balance,
        size: 100,
        color: Colors.brown,
      ),
    );
  }

  Widget _inputFieldEmail(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.brown, width: 3));
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.person, color: Color.fromARGB(255, 243, 255, 253), size: 40,

        ),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _inputFieldPassword(String hintText, TextEditingController controller) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.brown, width: 3));
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(Icons.key, color: Color.fromARGB(255, 243, 255, 253), size: 40),
        filled: true,
        fillColor: Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 10),
          icon: _obscureText ? Icon(Icons.remove_outlined, color: Colors.black, size: 30)
              : Icon(Icons.remove_red_eye, color: Colors.black, size: 30),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      obscureText: _obscureText,
    );
  }

  Widget _loginBtn() {
    loginC controller = Get.put(loginC());
    return ElevatedButton(
      onPressed: () {
        //if(_formKey.currentState!.validate()){
          loginC.instance.onLogin(controller.email.text.trim(), controller.pass.text.trim());
        //}
      },
      child: SizedBox(
        width: 100,
        child: Text(
          "Login ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 20.0,
                color: Colors.black,
                offset: Offset(2, 1),
              ),
            ],
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Color.fromARGB(255, 250, 92, 97),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }

  Widget _extrText() {
    return Text(
      "Forgot Password?",
      style: TextStyle(fontSize: 18, color: Colors.amber, fontWeight:FontWeight.bold ),

    );
  }

  Widget _regButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => reg()),
        );
      },
      child: SizedBox(
        width: 100,
        child: Text(
          "Register ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 20.0,
                color: Colors.black,
                offset: Offset(2, 1),
              ),
            ],
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 250, 92, 97),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}

