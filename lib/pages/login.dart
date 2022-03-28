// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/produtos_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey=  GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  get body => null;
 verificaForm(){
   if(_formKey.currentState!.validate()){
     Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ProdutosPage()));
   }
 }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/Logo/Logo.jpg',
              fit: BoxFit.cover,
            )),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        Column(
         mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Form(
              key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  
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
                                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regExp = new RegExp(pattern);
                                  if (value!.isEmpty) {
                                    return 'Informe o email';
                                  }
                                  if(!regExp.hasMatch(value)){
                                         return "Email inválido";
                                     }
                                  return null;
                                }),
                            SizedBox(
                              height: 20,
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
                                }
                                ),
                      ],
                    ),
                  ),

                ),
                              SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      color: Colors.blue.withOpacity(0.6),
                      onPressed: verificaForm,
                      child: Container(
                        
                          width: double.infinity,
                          
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                          )),
                    )

                        ]),
                      ),
                    ),
          ],
        ),         
         
      ],
    ));
  }
}
