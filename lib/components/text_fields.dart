import 'package:flutter/material.dart';

class TextFields {
  static Container authPagesTextField(String hintText,TextEditingController textEditingController) {
    return Container(
      child: TextField(  
        controller: textEditingController,     
        
        decoration: InputDecoration(hintText: hintText, border: OutlineInputBorder()),
      ),
      decoration: BoxDecoration(color: Color(0xFFDADADA), borderRadius: BorderRadius.circular(8)),
    );


  }

}

