import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/widget_support.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final bool isWide = width >= 700;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F3),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Opacity(
                opacity: 0.18,
                child: Image.asset(
                  "images/pan.png",
                  width: double.infinity,
                  height: 260.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480.0),
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
                  const SizedBox(height: 10.0),
                  Center(
                    child: Container(
                      width: isWide ? 108.0 : 94.0,
                      height: isWide ? 108.0 : 94.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 18.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Image.asset("images/logo.png", fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26.0),
                  Text("Welcome Back", style: AppWidget.HeadlineTextFeildStyle()),
                  const SizedBox(height: 8.0),
                  const Text(
                    "Log in to continue ordering your favorite meals in minutes.",
                    style: TextStyle(color: Colors.black54, fontSize: 16.0, height: 1.5),
                  ),
                  const SizedBox(height: 28.0),
                  _AuthField(
                    label: "Email Address",
                    hint: "Enter your email",
                    icon: Icons.mail_outline_rounded,
                  ),
                  const SizedBox(height: 18.0),
                  _AuthField(
                    label: "Password",
                    hint: "Enter your password",
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                  ),
                  const SizedBox(height: 12.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Color(0xFF0C7233),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
                        "Log In",
                        style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text("or continue with", style: TextStyle(color: Colors.black54)),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 22.0),
                  Row(
                    children: [
                      Expanded(child: _SocialCard(label: "Google", icon: Icons.g_mobiledata_rounded, compact: width < 360)),
                      const SizedBox(width: 14.0),
                      Expanded(child: _SocialCard(label: "Facebook", icon: Icons.facebook_rounded, compact: width < 360)),
                    ],
                  ),
                  const SizedBox(height: 28.0),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black54, fontSize: 15.0),
                          children: [
                            TextSpan(
                              text: "Sign Up",
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
          ],
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

class _SocialCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool compact;

  const _SocialCard({required this.label, required this.icon, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: compact ? 24.0 : 30.0, color: Colors.black87),
          SizedBox(width: compact ? 4.0 : 8.0),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: compact ? 12.0 : 14.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
