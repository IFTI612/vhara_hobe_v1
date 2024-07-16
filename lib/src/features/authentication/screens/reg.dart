import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

import 'package:vhara_hobe_v1/src/features/authentication/screens/login.dart';

import '../controllers/regC.dart';

class reg extends StatefulWidget {
  const reg({super.key});

  @override
  State<reg> createState() => _regState();
}


class _regState extends State<reg> {
  @override

  bool _obscureText = true;
  final c = Get.put(regC());

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyanAccent,
              Colors.limeAccent,
            ]

        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Image.asset('assets/images/AUST_Reg.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              opacity: const AlwaysStoppedAnimation(0.85),
            ),
            Positioned.fill(child:
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(color: Colors.transparent),
              ),
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
      padding: const EdgeInsets.all(12.0),

      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            key: _formKey,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icon(),
              const SizedBox(height: 30),
              _inputUserName("User Name",Get.find<regC>().UserName),
              const SizedBox(height: 15),
              _inputfieldEmail("Email",Get.find<regC>().email),
              const SizedBox(height: 15),
              _inputfieldNID("NID",Get.find<regC>().nid),
              const SizedBox(height: 15),
              _inputfieldPassword("Password",Get.find<regC>().pass),
              const SizedBox(height: 15),
              //_inputfieldPassword("Confirm Password",Get.find<regC>().Confpass),
              const SizedBox(height: 25),
              _regBtn(),
              const SizedBox(height: 15),
              _back_to_login(),

            ],

          ),
        ),

      ),
    );
  }

  Widget _icon(){
    return Container(
      child: const Icon(Icons.account_circle,size: 100,color :Colors.brown),

    );

  }


  Widget _inputUserName(String hintText,TextEditingController controller){

    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.brown, width: 3));
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.person,  color: Color.fromARGB(255, 243, 255, 253), size: 40),
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _inputfieldEmail(String hintText,TextEditingController controller){

    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.brown, width: 3));
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.email,  color: Color.fromARGB(255, 243, 255, 253), size: 40),
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _inputfieldNID(String hintText,TextEditingController controller){

    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.brown, width: 3));
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.card_travel,  color: Color.fromARGB(255, 243, 255, 253), size: 40),
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  Widget _inputfieldPassword(String hintText,TextEditingController controller){

    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.brown, width: 3));
    return TextField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.key,  color: Color.fromARGB(255, 243, 255, 253), size: 40),
        filled: true,
        fillColor: const Color.fromARGB(255, 243, 255, 253),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        enabledBorder: border,
        focusedBorder: border,
        suffixIcon: IconButton(
          padding: const EdgeInsets.only(right: 10),
          icon: _obscureText ? const Icon(Icons.remove_outlined, color: Colors.black, size: 30)
              : const Icon(Icons.remove_red_eye, color: Colors.black, size: 30),
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



  Widget _regBtn(){

    regC controller = Get.put(regC());
    return ElevatedButton(onPressed: (){
      //if(_formKey.currentState!.validate()){
        regC.instance.registerUser(controller.email.text.trim(), controller.pass.text.trim());
      //}

    },

      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 250, 92, 97),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 10),
      ),
      child:const SizedBox(width: 100,
        child: Text("Sign In",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18 , color: Colors.black87),
        ),
      ),

    );

  }

  Widget _back_to_login() {

    return TextButton(onPressed: (){
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const login()),
      );
    },

      child:const Text("Already registered?",
        style: TextStyle(fontSize: 18 , color: Colors.amber),
      ),

    );

  }

}