import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manda_cakes/pages/homePage.dart';
import 'package:manda_cakes/services/autenticacao.dart';
import 'package:provider/provider.dart';

import 'CartPage.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextButton.icon(
                    label: Text('Home'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    },
                    icon: Icon(Icons.home_max_outlined),
                  ),
                ],
              ),
              TextButton.icon(
                label: Text('Carrinho'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CartPage()),
                  );
                },
                icon: Icon(Icons.shopping_cart_outlined),
              ),
              TextButton.icon(
                label: Text('Perfil'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PerfilPage()),
                  );
                },
                icon: Icon(Icons.person_outline_rounded),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user!.photoURL!),
                        ),
                        Positioned(
                          right: -9,
                          bottom: 0,
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            child: FlatButton(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: BorderSide(color: Colors.white)),
                              color: Color(0xFFF5F6F3),
                              onPressed: () {},
                              child: Icon(
                                Icons.camera_alt_sharp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  user.displayName!,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  user.email!,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    onPressed: () {
                      final provider =
                          Provider.of<Autenticacao>(context, listen: false);
                      provider.logout();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
