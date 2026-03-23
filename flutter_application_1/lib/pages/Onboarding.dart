import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double imageSize = width > 700 ? 420.0 : width * 0.82;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24.0, 30.0, 24.0, 24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480.0),
              child: Column(
                children: [
                  Image.asset(
                    "images/onboard.png",
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    "Upang Express",
                    textAlign: TextAlign.center,
                    style: AppWidget.HeadlineTextFeildStyle(),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Craving for something delicious? \nUpang Express is here to satisfy your hunger!",
                    style: AppWidget.SimpleTextFeildStyle(),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40.0),
                  Container(
                    height: 60.0,
                    width: width > 700 ? 260.0 : width * 0.55,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 35, 77, 14),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: TextButton(
                        key: const Key('get-started-button'),
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
