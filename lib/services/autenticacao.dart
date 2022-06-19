import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/HomePage.dart';


class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class Autenticacao extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = false;

  // final googleSignin = GoogleSignIn();
  // GoogleSignInAccount? user;

  Autenticacao() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
    notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }


  // Future googleLogin()async{
  //   final googleUser = await googleSignin.signIn();
  //   if(googleUser == null) return;
  //   user = googleUser;

  //   final googleAuth = await googleUser.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   await FirebaseAuth.instance.signInWithCredential(credential);
   
  //   MaterialPageRoute(builder: (context) => HomePage());    
  // }


  cadastrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Este email já está cadastrado');
      }
      
    }
  }

  login(String email, String senha) async {
       FirebaseAuth.instance.userChanges();

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);

      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Usuário não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
   FirebaseAuth.instance.signOut();
    usuario = null;
    notifyListeners();
  }
}