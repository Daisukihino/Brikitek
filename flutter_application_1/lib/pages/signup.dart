import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double heroHeight = width >= 700 ? 180.0 : 150.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              const SizedBox(height: 4.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0C7233), Color(0xFF58A05B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      "Join Upang Express and get your meals delivered fast and fresh.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 18.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.asset(
                        "images/onboard.png",
                        height: heroHeight,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26.0),
              Text("Let's get started", style: AppWidget.HeadlineTextFeildStyle()),
              const SizedBox(height: 8.0),
              const Text(
                "Fill in your details to create a new account.",
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
              ),
              const SizedBox(height: 24.0),
              _AuthField(
                label: "Full Name",
                hint: "Enter your full name",
                icon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: 16.0),
              _AuthField(
                label: "Email Address",
                hint: "Enter your email",
                icon: Icons.mail_outline_rounded,
              ),
              const SizedBox(height: 16.0),
              _AuthField(
                label: "Phone Number",
                hint: "Enter your phone number",
                icon: Icons.call_outlined,
              ),
              const SizedBox(height: 16.0),
              _AuthField(
                label: "Password",
                hint: "Create a password",
                icon: Icons.lock_outline_rounded,
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              _AuthField(
                label: "Confirm Password",
                hint: "Re-enter your password",
                icon: Icons.verified_user_outlined,
                obscureText: true,
              ),
              const SizedBox(height: 18.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.check_circle_outline_rounded, color: Color(0xFF0C7233)),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "By signing up, you agree to our Terms of Service and Privacy Policy.",
                        style: TextStyle(color: Colors.black54, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C7233),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: Color(0xFF0C7233),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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

class _AuthField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscureText;

  const _AuthField({
    required this.label,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10.0),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color(0xFF0C7233)),
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
