import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart' as userModel;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  userModel.User _userFromFireBaseUser(User user) {
    return user != null ? userModel.User(userId: user.uid) : null;
  }

  //auth change user Stream

  Stream<userModel.User> get user {
    return _auth
        .authStateChanges()
        .map((User user) => (_userFromFireBaseUser(user)));
    // .map(_userFromFireBaseUser);
  }

  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {}
  }

  Future signInWithFacebook() async {
    try {
      final FacebookLogin facebookLogin = FacebookLogin();
      final result = await facebookLogin.logIn(['email']);
      final token = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
      print(graphResponse.body);

      if (result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential =
            FacebookAuthProvider.credential(token);
        var result = await _auth.signInWithCredential(credential);
        var user = result.user;
        return _userFromFireBaseUser(user);
      }
    } catch (e) {}
  }

  Future loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      var result = await FirebaseAuth.instance.signInWithCredential(credential);
      var user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
