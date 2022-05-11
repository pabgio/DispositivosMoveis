import 'package:flutter/material.dart';
import 'package:mandaCakes/meuApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mandaCakes/repositories/carrinho_repositorie.dart';
import 'package:provider/provider.dart';
import 'meuApp.dart';
import 'package:mandaCakes/services/autenticacao.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Autenticacao()),
        ChangeNotifierProvider(create: (_) => CarrinhoRepository()),
      ],
      child: meuApp(),
    ),
  );
}
