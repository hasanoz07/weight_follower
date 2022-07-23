import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:kilo_takipcisi/components/buttons.dart';
import 'package:kilo_takipcisi/components/text_fields.dart';
import 'package:kilo_takipcisi/views/forget_password.dart';
import 'package:kilo_takipcisi/views/home.dart';
import 'package:kilo_takipcisi/views/register.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(FontAwesomeIcons.backward),
              ),
              Text(
                "Hoşgeldiniz sağlıklı yaşam için giriş yap",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "Urbanist",
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFields.authPagesTextField("E-Posta", emailController),
                  SizedBox(
                    height: 15,
                  ),
                  TextFields.authPagesTextField("Parola", passwordController),
                  TextButton(
                    onPressed: () {
                      Get.to(ForgetPassword());
                    },
                    child: Text("Parolamı Unuttum ?"),
                  ),
                ],
              ),
              Buttons.startPagesButton(
                context,
                "Giriş Yap",
                Colors.black, 
                Colors.white,
                () async {
                  SignInWithEmailandPassword(emailController.text, passwordController.text, auth);
                },
              ),
              Center(child: Text("Diğer Giriş Seçenekleri")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      SignInWithGoogle();
                    },
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    iconSize: 40,
                  ),
                  /*
                  IconButton(
                    onPressed: () {
                      
                    },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("Bir hesaba sahip değil misiniz ? ")),
                  TextButton(
                      onPressed: () {
                        Get.to(RegisterPage());
                      },
                      child: Text("Hesap Oluşturun"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> SignInWithEmailandPassword(
    String email, String password, FirebaseAuth auth) async {
  try {
    var _userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    debugPrint(_userCredential.toString());
    Get.to(Home());
  } catch (e) {
    debugPrint(e.toString());
    e.printError();


  }
}

void SignInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  var _userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  if (_userCredential.user!.uid.isEmpty != true) {
    Get.to(Home());
  }
}
