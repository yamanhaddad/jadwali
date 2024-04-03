import 'package:firebase_auth/firebase_auth.dart';
import 'package:jadwali_test_1/db/db_helper.dart';

class AuthService {
  //getters
  static final FirebaseAuth _auth =
      FirebaseAuth.instance; // get a firebase instance
  static User? get currentUser => _auth.currentUser; // ?: nunnable // gets current loged in user

  static Future<bool> loginP(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    //credential.user.metadata.  --> you can get info about the user form this
    return DbHelper.isParent(credential.user!.uid);
  }
// this is another method
  static Future<void> logout(){
    return _auth.signOut();
  }

}
