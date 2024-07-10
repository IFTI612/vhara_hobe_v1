import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/home_page.dart';
import 'package:vhara_hobe_v1/src/features/authentication/screens/login.dart';
import 'package:vhara_hobe_v1/src/repository/auth_repository/exceptions/signup_email_password_failure.dart';


class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;

  _setInitialScreen(User? user) {
    (user == null)
        ? Get.offAll(() => const login())
        : Get.offAll(() => const HomePage());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  Future<void> createUserWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      firebaseUser.value != null ? Get.offAll(() => const login()):Get.offAll(() => const HomePage());

      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid, //Username + NID needs to be added
        'email': email,
      });
    } on FirebaseAuthException catch (e) {
      final ex = signUpWithEmailPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = signUpWithEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String pass) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      firebaseUser.value != null ? Get.offAll(() => const HomePage()) :Get.offAll(() => const login());

      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid' : userCredential.user!.uid, //Username + NID needs to be added
        'email': email,
      });
    } on FirebaseAuthException catch (e) {
      final ex = signUpWithEmailPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = signUpWithEmailPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void>logOut()async=> await _auth.signOut();
}
