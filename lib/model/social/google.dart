import 'package:google_sign_in/google_sign_in.dart';

import '../dprint.dart';

class GoogleLogin {

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  login(Function(String type, String id, String name, String photo) callback, Function(String) callbackError) async{
    try {
      dprint("Google Login Start...");
      // _googleSignIn.signInSilently().whenComplete(() => print('initiated sign in with google'));
      // await _googleSignIn.signIn();
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      if(googleUser != null ){
      print(googleUser.email);

  // Obtain the auth details from the request
  // final GoogleSignInAuthentication googleAuth = await googleUser?.authentication;
   
      if (_googleSignIn == null){
        callbackError("login_canceled");
        return;
      }
      // dprint("${_googleSignIn.currentUser.email}");
      // dprint("${_googleSignIn.currentUser.displayName}");
      // dprint("${_googleSignIn.currentUser.photoUrl}");
      callback("google", googleUser.id, googleUser.displayName, googleUser.photoUrl);
      }else{
        print(googleUser);
        print('tthis is google account null');
      }
      // callback("google", _googleSignIn.currentUser.id, _googleSignIn.currentUser.displayName, _googleSignIn.currentUser.photoUrl);
    } catch (error) {
      dprint(error.toString());
      callbackError("$error");
    }
  }
}