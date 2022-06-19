import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manda_cakes/meuApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manda_cakes/services/goggle_login.dart';
//import 'package:mandaCakes/repositories/carrinho_repositorie.dart';
import 'package:provider/provider.dart';
import 'meuApp.dart';
import 'package:manda_cakes/services/autenticacao.dart';
import 'firebase_options.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  
  //await FirebaseAuth.instance.useAuthEmulator('localhost',9099);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Autenticacao()),
        ChangeNotifierProvider(create: (_) => GoogleLogin()),
      ],
      child: const meuApp(),
    ),
  );
}
