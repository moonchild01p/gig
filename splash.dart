import 'package:flutter/material.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/theme/app_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Attendre 2 secondes puis naviguer vers la page de login
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/gig_logo.png',
                height: height * 0.2,
                width: width * 0.5,
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
              const SizedBox(height: 20),
              const CustomText(text: 'GIG ALGERIA', size: 26),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;

  const CustomText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Times New Roman',
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: AppColors.background,
        letterSpacing: 1,
      ),
    );
  }
}
