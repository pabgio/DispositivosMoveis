import 'package:flutter/material.dart';
import 'package:manda_cakes/widgets/auth_check.dart';
class meuApp extends StatelessWidget {
  const meuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Manda Cakes',
      theme: ThemeData(
        backgroundColor: Color.fromARGB(255, 181, 230, 236),
      ),
      home: AuthCheck(),
    );
  }
}
