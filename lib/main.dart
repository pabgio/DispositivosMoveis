import 'package:flutter/material.dart';
import 'package:mandaCakes/meuApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'meuApp.dart';
import 'package:mandaCakes/services/autenticacao.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Autenticacao(),
        ),
      ],        
      child: meuApp(),
    ),
  );
}