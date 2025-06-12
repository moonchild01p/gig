import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/vitrine.dart'; // Redirection directe après inscription
import 'package:my_app/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Signup successful")),
        );

        // ✅ Redirection vers la vitrine
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Vitrine()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMsg = 'An error occurred';
        if (e.code == 'email-already-in-use') {
          errorMsg = 'Email already in use';
        } else if (e.code == 'invalid-email') {
          errorMsg = 'Invalid email';
        } else if (e.code == 'weak-password') {
          errorMsg = 'Password too weak';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMsg)),
        );
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
            flex: 6,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
              decoration: const BoxDecoration(
                color: Color(0xFF1E0A6D),
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Flèche de retour
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                      ),
                    ),

                    const CustomText(
                      text: 'Create Account',
                      size: 26,
                    ),
                    const SizedBox(height: 10),

                    _buildTextField(controller: nameController, hint: 'Name', icon: Icons.person, obscureText: false),
                    const SizedBox(height: 5),
                    _buildTextField(controller: emailController, hint: 'Email', icon: Icons.email, obscureText: false, isEmail: true),
                    const SizedBox(height: 5),
                    _buildTextField(controller: phoneController, hint: 'Phone Number', icon: Icons.phone, obscureText: false),
                    const SizedBox(height: 5),
                    _buildTextField(controller: passwordController, hint: 'Password', icon: Icons.lock, obscureText: true),
                    const SizedBox(height: 5),
                    _buildTextField(controller: confirmPasswordController, hint: 'Confirm Password', icon: Icons.lock, obscureText: true, isConfirm: true),

                    SizedBox(height: height * 0.05),
                    GestureDetector(
                      onTap: _signup,
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.1,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.background,
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
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    bool isEmail = false,
    bool isConfirm = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$hint cannot be empty';
          }
          if (isEmail && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Enter a valid email';
          }
          if (isConfirm && value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 25.0),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.primary),
          prefixIcon: Icon(icon, color: AppColors.primary),
          fillColor: AppColors.background,
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double size;

  const CustomText({
    super.key,
    required this.text,
    required this.size,
  });

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
