// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ShoppingApp/pages/cadastro.dart';
import 'package:provider/provider.dart';
import 'package:ShoppingApp/services/autenticacao.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  bool loading = false;

  get body => null;

  login() async {
    setState(() => loading = true);
    try {
      await context.read<Autenticacao>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 200,
                  height: 135,
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
                                scrollPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 20),
                                  labelText: 'E-mail',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
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
                                scrollPadding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                controller: senha,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 20),
                                  isDense: true,
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
                                  return null;
                                } //imput
                                ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              child: ElevatedButton(
                                onPressed: verificaForm,
                                child: Container(
                                    width: double.infinity,
                                    child: Text(
                                      'Login',
                                      textAlign: TextAlign.center,
                                    )),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CadastroPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Ainda não tem conta? Cadastre-se agora.',
                                  style: TextStyle(color: Colors.blue),
                                )),
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
