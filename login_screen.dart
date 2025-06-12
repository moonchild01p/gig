import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/signup_screen.dart';
import 'package:my_app/screens/vitrine.dart'; // Assure-toi que ce chemin est correct

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _loading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Aller à la page Vitrine après connexion
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Vitrine()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur : ${e.toString()}")),
        );
      } finally {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Image.asset(
              'assets/gig_logo.png',
              width: 100,
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: const BoxDecoration(
                color: Color(0xFF1E0A6D),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const CustomText(text: 'Welcome\nback!', size: 26),
                    const SizedBox(height: 30),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) return "Email cannot be empty";
                        if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                            .hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: _inputDecoration("Email", Icons.email),
                    ),

                    const SizedBox(height: 20),

                    // Password
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      validator: (value) =>
                          value!.isEmpty ? "Password cannot be empty" : null,
                      decoration: _inputDecoration("Password", Icons.lock)
                          .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.primary,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                    ),

                    const SizedBox(height: 30),

                    // Login Button
                    SizedBox(
                      width: width * 0.6,
                      height: height * 0.07,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        onPressed: _loading ? null : _login,
                        child: _loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Times New Roman',
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // "New user? Sign up" text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New user? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: AppColors.accent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Times New Roman',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.primary),
      prefixIcon: Icon(icon, color: AppColors.primary),
      fillColor: AppColors.background,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: AppColors.primary),
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
