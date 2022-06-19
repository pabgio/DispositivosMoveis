import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_cakes/pages/HomePage.dart';
import 'package:manda_cakes/pages/login.dart';
import 'package:manda_cakes/services/autenticacao.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/goggle_login.dart';

class AuthCheck extends StatefulWidget {
  AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    Autenticacao auth = Provider.of<Autenticacao>(context);
    //GoogleLogin googleLogin = Provider.of<GoogleLogin>(context);

    if (auth.isLoading) {
      return loading();
    } if (auth.usuario ==null ) {
         FirebaseAuth.instance.userChanges();

      return LoginPage();
    } else
       FirebaseAuth.instance.userChanges();
      return HomePage();
  }

  
  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),

      ),
    );
  }
}

