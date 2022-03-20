import 'package:apphelpdeskaluno/model/Users.dart';
import 'package:apphelpdeskaluno/util/AppColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  //const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Controllers dos TextField
  TextEditingController nomeController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();

  String msgErro = "";

  void validarCampos() {
    //1 Passo - Recuperar os dados
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length < 6) {
          msgErro = "Preencha a senha com mais de 6 caracteres!";
        } else {
          //Cadastre no banco de dados

          //1 Passo - receber os dados da interface em um objeto model
          Users user = new Users();

          user.nome = nome;
          user.email = email;
          user.senha = senha;

          //2 Passo - Executar o metodo cadastrarUsuario(user)
          cadastrarUsuario(user);
        }
      }
    } else {
      msgErro = "Preencha o campo nome!";
    }
  }

  //Metodo que cadastra no firebase o usuario
  void cadastrarUsuario(user) async {
    //Instanciarmos o firebase
    FirebaseAuth auth = FirebaseAuth.instance;

    auth
        .createUserWithEmailAndPassword(email: user.email, password: user.senha)
        .then((firebaseUser) {
      final SnackBar snackBar = SnackBar(
          content: Text('Cadastrado com sucesso!'),
          duration: Duration(seconds: 5));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((erro) {
      print('Aconteceu o erro: ' + erro.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crie sua conta agora mesmo!"),
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
                'Cadastro',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: AppColors.textColorBlue,
                        fontWeight: FontWeight.w500)),
              ),
              Text(
                'Crie sua conta agora mesmo!',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 22,
                  color: AppColors.textColorBlue,
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                color: AppColors.primaryOpacityColor,
                child: TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                      hintText: 'Nome',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      prefixIcon:
                          Icon(Icons.person, color: AppColors.primaryColor)),
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
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColor),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: validarCampos),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: AppColors.buttonRed),
                  child: Text(
                    'Voltar',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print("clicou no botao voltar");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(top: 1, bottom: 3),
      child: Lottie.asset('assets/animations/animacao-users.json',
          width: 250, height: 250, fit: BoxFit.fill),
    );
  }
}
