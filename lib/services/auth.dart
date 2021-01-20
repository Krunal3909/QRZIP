import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/models/user_model.dart';
import 'package:shopping_app/services/database.dart';
import 'package:shopping_app/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //register with mail and password
  Future registerWithMainAndPass(String email, String password, String username,
      int gender, DateTime dob, String mobileno) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      await DatabaseServices(uid: user.uid).updateUserData(username, gender, email, dob, mobileno, password);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Login User with email
  Future LoginWithMainAndPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
