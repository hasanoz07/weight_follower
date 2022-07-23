import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Buttons {
  static InkWell startPagesButton(
      BuildContext context, String title, Color buttonColor, Color titleColor, void Function()? function) {
    return InkWell(
      onTap: function,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: titleColor, fontSize: 15, fontFamily: "Urbanist"),
        )),
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 14,
      ),
    );
  }

  static IconButton backButton() {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(FontAwesomeIcons.backward),
    );
  }
}
