import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0),
        child: Column(children: [
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/logo.png",
                 width: 120.0,
                  height: 70.0, fit: BoxFit.contain,
                ),
                Text("Order your favorite food!", style: AppWidget.SimpleTextFeildStyle(),)
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              "images/boy.png",
               width: 70.0,
                height: 70.0, fit: BoxFit.cover,
              ),
          ),
        ],)
      ],),
      ),
    );
  }
}