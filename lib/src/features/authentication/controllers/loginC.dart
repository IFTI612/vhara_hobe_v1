import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/auth_repository/auth_repository.dart';


class loginC extends GetxController{
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  static loginC get instance => Get.find();




  void onLogin(String email, String pass) {
    AuthRepository.instance.loginWithEmailAndPassword(email, pass);
    }
}


