// ignore_for_file: deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:manda_cakes/pages/login.dart';
import 'package:manda_cakes/pages/homePage.dart';
import 'package:manda_cakes/services/autenticacao.dart';
import 'package:provider/provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPage();
}

class _CadastroPage extends State<CadastroPage> {
  final _formKeyCadastro = GlobalKey<FormState>();
  final nome = TextEditingController();
  final celular = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final senhaRepita = TextEditingController();
  bool loading = false;

  get body => null;
  verificaForm() {
    if (_formKeyCadastro.currentState!.validate()) {
      cadastrar();
      _formKeyCadastro.currentState!.reset();
      
      

    }


  }

  cadastrar() async {
    setState(() => loading = false);
    try {
      await context.read<Autenticacao>().cadastrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = true);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));

    }
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'Cadastro',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ),
          Form(
            key: _formKeyCadastro,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      // TextFormField(
                      //     controller: nome,
                      //     keyboardType: TextInputType.name,
                      //     decoration: InputDecoration(
                      //       labelText: 'Nome',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       prefixIcon: Padding(
                      //         padding: EdgeInsets.all(10),
                      //         child: Icon(Icons.people),
                      //       ),
                      //     ),
                      //     validator: (value) {
                      //       if (value!.isEmpty) {
                      //         return 'Informe o Nome';
                      //       }

                      //       return null;
                      //     }),
                      // SizedBox(
                      //   height: 10,
                      // ), //imput NOme
                      // TextFormField(
                      //     controller: celular,
                      //     keyboardType: TextInputType.number,
                      //     decoration: InputDecoration(
                      //       labelText: 'Celular',
                      //       //icon: Icon.,
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //       prefixIcon: Padding(
                      //         padding: EdgeInsets.all(10),
                      //         child: Icon(Icons.phone_android),
                      //       ),
                      //     ),
                      //     validator: (value) {
                      //       String mask = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      //       RegExp regExp = RegExp(mask);
                      //       if (value!.isEmpty) {
                      //         return 'Informe o Celular';
                      //       }
                      //       if (!regExp.hasMatch(value)) {
                      //         return "Celular inválido";
                      //       }
                      //       return null;
                      //     }), //Imput Celular
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10),
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
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.password),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe a senha';
                            }
                            if (value.length < 6) {
                              return 'A senha deve ter no mínimo 6 caracteres';
                            } else
                              return null;
                          }), //imput Senha
                      SizedBox(
                        height: 10,
                      ),

                      ElevatedButton(
                        onPressed: verificaForm,
                        child: Container(
                            width: double.infinity,
                            child: Text(
                              'Cadastrar',
                              textAlign: TextAlign.center,
                            )),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text('Já possui usuário? Clique aqui'),
                      )
                    ]),
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
      
      
      body: _body(),
    );
  }
}
