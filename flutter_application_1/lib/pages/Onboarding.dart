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
          SizedBox(height: 30.0,),
          Text("Upang Express", 
          textAlign: TextAlign.center,
          style: AppWidget.HeadlineTextFeildStyle(),
          ),
          SizedBox(height: 20.0,),
          Text("Craving for something delicious? \nUpang Express is here to satisfy your hunger!",
          style: AppWidget.SimpleTextFeildStyle(),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.0,),
          Container(
            height: 60.0,
            width: MediaQuery.of(context).size.width /2,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 35, 77, 14),borderRadius: BorderRadius.circular(30.0)),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: const Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),),
              ),
          )
      ],
      ),
      ),
    );
  }
}