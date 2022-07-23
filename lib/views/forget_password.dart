import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takipcisi/components/buttons.dart';
import 'package:kilo_takipcisi/components/text_fields.dart';
import 'package:kilo_takipcisi/components/texts.dart';
import 'package:kilo_takipcisi/views/login_page.dart';
import 'package:kilo_takipcisi/views/start_page.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  String? email;
  final myController = TextEditingController();
  FirebaseAuth auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Buttons.backButton(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 16,
                    ),
                    Texts.authPagesTitle("Paralomu Sıfırla"),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    TextFields.authPagesTextField("asda",myController),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 16,
                    ),
                    Buttons.startPagesButton(context, "Kodu Gönder", Colors.black, Colors.white, () async {
                     try {
                       await auth.sendPasswordResetEmail(email: myController.text);
                       Get.to(StartPage());
                     } catch (e) {
                       debugPrint(e.toString());
                     }
                     
                      
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Parolamı Hatırladım"),
                    TextButton(
                        onPressed: () {
                          Get.to(LoginPage());
                        },
                        child: Text("Giriş Yap"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
