import 'package:flutter/material.dart';
class Texts{
  static Text authPagesTitle(String title){
    return Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: "Urbanist",
                ),
              );
  }
}
