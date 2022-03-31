// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/login.dart';
import 'package:flutter_aula1/pages/produtos_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPage();
}

class _CadastroPage extends State<CadastroPage> {
  final _formKeyCadastro = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _celular = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final _senhaRepita = TextEditingController();

  get body => null;
  verificaForm() {
    if (_formKeyCadastro.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
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
              ),
              Form(
                key: _formKeyCadastro,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                                controller: _nome,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(
                                  labelText: 'Nome',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Informe o Nome';
                                  }

                                  return null;
                                }),
                            SizedBox(
                              height: 10,
                            ), //imput NOme
                            TextFormField(
                                controller: _celular,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Celular',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  String pattern =
                                      r')''[0-9]{2})\s([0-9])\s([0-9]{4})\s([0-9]{4}))';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value!.isEmpty) {
                                    return 'Informe o Celular';
                                  }
                                  if (!regExp.hasMatch(value)) {
                                    return "Celular inválido";
                                  }
                                  return null;
                                }), //Imput Celular
                            SizedBox(
                              height: 10,
                            ),
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
                                }), //imput Senha
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                                controller: _senhaRepita,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Repita a senha';
                                  }
                                  return null;
                                }), //imput Senha
                            SizedBox(
                              height: 10,
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Color.fromARGB(255, 24, 151, 255)
                                  .withOpacity(0.6),
                              onPressed: verificaForm,
                              child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    'Cadastrar',
                                    textAlign: TextAlign.center,
                                  )),
                            ),
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
          title: Text('Cadastro'),
        ),
        body: Stack(children: [
          Container(
            color: Colors.white,
          ),
          _body(),
        ]));
  }
}
