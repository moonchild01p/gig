import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OTPVerificationScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  void _verifyOTP() async {
    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: _otpController.text.trim(),
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Connexion réussie !")),
      );
      // Navigue vers Home ou autre
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP invalide")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vérification OTP")),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text("Code envoyé à +213${widget.phoneNumber}"),
            const SizedBox(height: 20),
            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Entrez le code',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: const Text("Vérifier"),
            ),
          ],
        ),
      ),
    );
  }
}
