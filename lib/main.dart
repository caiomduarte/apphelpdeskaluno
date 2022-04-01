//import 'package:apphelpdeskaluno/pages/home/home_page.dart';
import 'package:apphelpdeskaluno/pages/home/home_page.dart';
import 'package:apphelpdeskaluno/pages/login/login_page.dart';
import 'package:apphelpdeskaluno/pages/register/register_page.dart';
//import 'package:apphelpdeskaluno/pages/register/register_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //Função para inicializar o firebase (segundo a documentação);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///Para testarmos vamos inserir um usuario
  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection("usuarios").doc("002").set({"nome": "João"});

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'home': (BuildContext context) => HomePage(),
      'login': (BuildContext context) => LoginPage(),
      'register': (BuildContext contex) => RegisterPage(),
    },
  ));
}
