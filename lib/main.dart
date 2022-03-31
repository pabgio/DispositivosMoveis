import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/login.dart';
import 'package:flutter_aula1/pages/produtos_page.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatelessWidget {
  const Aplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Manda Cakes',
      theme: ThemeData(
        backgroundColor: Color.fromARGB(255, 181, 230, 236),
      ),
      home: LoginPage(),
    );
  }
}
