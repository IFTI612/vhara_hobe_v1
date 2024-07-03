import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../repository/auth_repository/auth_repository.dart';

class regC extends GetxController {
  static regC get instance => Get.find();

  TextEditingController UserName = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController Confpass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nid = TextEditingController();

  void registerUser(String email, String pass) {

    AuthRepository.instance.createUserWithEmailAndPassword(email, pass);
  }
}
