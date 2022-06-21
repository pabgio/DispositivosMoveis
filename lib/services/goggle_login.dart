import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../pages/HomePage.dart';

class GoogleLogin extends ChangeNotifier{
  final googleSignin = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin()async{
    final googleUser = await googleSignin.signIn();
    if(googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    //MaterialPageRoute(builder: (context) => HomePage());    


    notifyListeners();
    
  }


  Future abrirGaleria() async {

    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);   
      
    if(pickedFile != null){
     setState() {
           user.photoUrl != null ? (pickedFile.path) : null;

           notifyListeners();

        }

  }
  }
}