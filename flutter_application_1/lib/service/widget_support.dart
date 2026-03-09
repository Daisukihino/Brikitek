import 'package:flutter/material.dart';

class AppWidget{

  static TextStyle HeadlineTextFeildStyle(){
    return TextStyle(
      color: Colors.black, fontSize: 30.0,fontWeight: FontWeight.bold
    );
  }

  static TextStyle SimpleTextFeildStyle(){
    return TextStyle(
      color: Colors.black, fontSize: 18.0,
    );
  }

  static TextStyle whiteTextFeildStyle(){
    return TextStyle(
      color: Colors.white, fontSize: 18.0,fontWeight: FontWeight.bold
    );
  }
}