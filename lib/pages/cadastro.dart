// ignore_for_file: deprecated_member_use

import 'dart:ffi';

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
    return 
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
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(
                                        10), 
                                    child: Icon(Icons.people),
                                  ),
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
                                  //icon: Icon.,
                                  border: OutlineInputBorder(),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(
                                        10), 
                                    child: Icon(Icons.phone_android),
                                  ),
                                ),
                                validator: (value) {
                                  String mask = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                  RegExp regExp = RegExp(mask);
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
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(
                                        10), 
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
                                controller: _senha,
                                obscureText: true,
                                decoration: InputDecoration(
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
                                  if(value != _senhaRepita){
                                    return 'As senhas devem ser iguais';
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
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(
                                        10), 
                                    child: Icon(Icons.password),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Repita a senha';
                                  }
                                  if(value != _senha){
                                    return 'As senhas devem ser iguais';
                                  }
                                  return null;
                                }), //imput Senha
                            SizedBox(
                              height: 10,
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Colors.green.withOpacity(0.6),
                              onPressed: verificaForm,
                              child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Cadastrar',
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RaisedButton(
                              textColor: Colors.white,
                              color: Colors.red.withOpacity(0.6),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      'Cancelar',
                                      textAlign: TextAlign.center,
                                    ),
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
        
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('CADASTRO'),
        ),
        body: Stack(children: [
          Container(
            color:Color.fromARGB(255, 175, 180, 180).withOpacity(0.5),
          ),
          _body(),
        ]));
  }
}
