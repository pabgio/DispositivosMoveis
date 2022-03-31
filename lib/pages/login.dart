// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/cadastro.dart';
import 'package:flutter_aula1/pages/produtos_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  get body => null;
  verificaForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ProdutosPage()));
    }
  }

  Widget _body() {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 150,
                  height: 110,
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
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder(),
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
                                controller: _senha,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe a senha';
                                  }
                                  return null;
                                }//imput
                                ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Color.fromARGB(255, 24, 151, 255)
                                  .withOpacity(0.6),
                              onPressed: verificaForm,
                              child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Login',
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Color.fromARGB(255, 24, 151, 255)
                                  .withOpacity(0.6),
                              onPressed: (){
                                Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => CadastroPage()));
                              },
                              child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Cadastre-se',
                                    textAlign: TextAlign.center,
                                  )),
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
        appBar: AppBar(
          centerTitle: true,
          title: Text('Manda Cakes'),
        ),
        body: Stack(children: [
          Container(
            color: Colors.white,
          ),
          _body(),
        ]));
  }
}
