import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../repository/auth_repository/auth_repository.dart';

class regC extends GetxController {
  static regC get instance => Get.find();

  TextEditingController UserName = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController Confpass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nid = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> registerUser(String email, String pass) {
    //AuthRepository.instance.createUserWithEmailAndPassword(email, pass);

    try {
      UserCredential credential = _auth.createUserWithEmailAndPassword(email: email, password: pass);
      return credential.user;
    }
    catch

  }
}
