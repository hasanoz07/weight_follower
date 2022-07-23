import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kilo_takipcisi/components/buttons.dart';
import 'package:kilo_takipcisi/components/text_fields.dart';
import 'package:kilo_takipcisi/components/texts.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  String? email;
  String? password;
  String? rePassword;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Buttons.backButton(),
              Texts.authPagesTitle("Hoşgeldiniz sağlıklı yaşam için üye ol"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFields.authPagesTextField("E-Posta", emailController),
                  SizedBox(
                    height: 15,
                  ),
                  TextFields.authPagesTextField("Şifre", passwordController),
                  SizedBox(
                    height: 15,
                  ),
                  TextFields.authPagesTextField("Tekrar Şifre", rePasswordController),
                ],
              ),
              Buttons.startPagesButton(
                context,
                "Üye ol",
                Colors.black,
                Colors.white,
                () async {if(passwordController.text==rePasswordController.text){
                 await auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  }else{
                    AlertDialog(title: Text("Hata"),);
                  }
                },
              ),
              Center(child: Text("Diğer Üyelik Seçenekleri")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    iconSize: 40,
                  ),
                  /*
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 45,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.twitter,
                      color: Colors.blueGrey,
                      size: 45,
                    ),
                  ),
                  */
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
