import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kilo_takipcisi/components/buttons.dart';
import 'package:kilo_takipcisi/views/login_page.dart';
import 'package:kilo_takipcisi/views/register.dart';


class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:60),
                child: startPagePhoto(),
              ),
              SizedBox(height: 150,),
              Buttons.startPagesButton(context, "Giriş Yap", Colors.black, Colors.white,GetLoginPage),
              SizedBox(height: 15),
              Buttons.startPagesButton(context, "Üye Ol", Colors.white, Colors.black,GetRegisterPage),
            ],
          ),
        ),
      ),
    );
  }

  Container startPagePhoto() {
    return Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage("assets/startPagePhoto.png"),
              ),
            ),
          );
  }

void GetLoginPage(){
  Get.to(LoginPage());
}}
void GetRegisterPage(){
  Get.to(RegisterPage());
}