import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signInWithEmail( String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      print(user);
      return true;
    } catch (e) {

    }

  }


  Future signInWithFacebook() async {

    try {
      final FacebookLogin facebookLogin = FacebookLogin();
      final result = await facebookLogin.logIn  (['email']);
      final token = result.accessToken.token;
      final graphResponse = await http.get(
                  'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
      print(graphResponse.body);

      if ( result.status == FacebookLoginStatus.loggedIn ) {
        final AuthCredential credential = FacebookAuthProvider.credential(token);
        _auth.signInWithCredential(credential);
      }
    } catch (e) {
    }

  }

  Future loginWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

    // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);

    } catch (e) {
        print(e.toString());
    }

  }

  Future<void> logOut() async {
    try{
      await _auth.signOut();
    } catch(e){
      print(e.toString());
    }
  }
}