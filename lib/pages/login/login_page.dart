import 'package:apphelpdeskaluno/util/AppColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();

  void efetuaLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: senhaController.text)
        .then((firebaseUser) {
      final SnackBar snackBar = SnackBar(
          content: Text('Login efetuado com Sucesso!'),
          duration: Duration(seconds: 5));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushNamed(context, 'home');
    }).catchError((erro) {
      print('Aconteceu o erro: ' + erro.toString());

      final SnackBar snackBar = SnackBar(
          content: Text('E-mail ou senha incorreta!'),
          duration: Duration(seconds: 5));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acesse nosso Aplicativo"),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              lottieAnimation(),
              Text(
                'HelpDesk!',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: AppColors.textColorBlue,
                        fontWeight: FontWeight.w500)),
              ),
              Text(
                'O seu aplicativo de helpdesk',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 22,
                  color: AppColors.textColorBlue,
                )),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                color: AppColors.primaryOpacityColor,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'E-mail',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      prefixIcon:
                          Icon(Icons.email, color: AppColors.primaryColor)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                color: AppColors.primaryOpacityColor,
                child: TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Senha',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      prefixIcon:
                          Icon(Icons.lock, color: AppColors.primaryColor)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.group_add,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Clicou em criar uma conta");
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Text('Criar uma conta',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textColorBlue))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.lock,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Clicou no Recuperar senha");
                      },
                      child: Text('Recupere sua senha',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textColorBlue))),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor),
                    child: Text(
                      'Acessar',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: efetuaLogin),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(top: 1, bottom: 3),
      child: Lottie.asset('assets/animations/helpdesk.json',
          width: 250, height: 250, fit: BoxFit.fill),
    );
  }
}
