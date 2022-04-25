// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mandaCakes/pages/cadastro.dart';
import 'package:provider/provider.dart';

import 'package:mandaCakes/pages/produtos_page.dart';
import 'package:mandaCakes/pages/produtos_page.dart';
import 'package:mandaCakes/services/autenticacao.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  get body => null;

    login() async {
    try {
      await context.read<Autenticacao>().login(email.text, senha.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  verificaForm() {
    if (_formKey.currentState!.validate()) {
      login();
    }
  }

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 200,
                  height: 170,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/Logo/Logo.jpg',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 20),
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(
                                        10), // add padding to adjust icon
                                    child: Icon(Icons.mail),
                                  ),
                                ),
                                validator: (value) {
                                  String pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value!.isEmpty) {
                                    return 'Informe o email';
                                  }
                                  if (!regExp.hasMatch(value)) {
                                    return "Email inválido";
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                controller: senha,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 20), 
                                  isDense: true,
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(
                                        10), 
                                    child: Icon(Icons.password),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe a senha';
                                  }
                                  return null;
                                } //imput
                                ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.green.withOpacity(0.6),
                                onPressed: verificaForm,
                                child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Color.fromARGB(255, 24, 151, 255)
                                    .withOpacity(0.6),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CadastroPage()));
                                },
                                child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      'Cadastre-se',
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            color: Colors.white,
          ),
          _body(),
        ]));
  }
}
