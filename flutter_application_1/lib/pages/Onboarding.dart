import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class Onboarding extends StatefulWidget{
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();

}

class _OnboardingState extends State<Onboarding>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        alignment: Alignment.center,
        child: Column(children: [
        Image.asset(
          "images/onboard.png", width: 388, height: 388,fit: BoxFit.cover,
          ),
          Text("Upang \nExpress", style: AppWidget.HeadlineTextFeildStyle(),),
      ],
      ),
      ),
    );
  }
}