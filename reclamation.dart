import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/base_scaffold.dart';
import 'notification_screen.dart';

class Reclamation extends StatefulWidget {
  const Reclamation({super.key});

  @override
  State<Reclamation> createState() => _ReclamationState();
}

class _ReclamationState extends State<Reclamation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('reclamations').add({
          'name': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'type': typeController.text.trim(),
          'message': messageController.text.trim(),
          'userId': user?.uid,
          'timestamp': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Message sent successfully.")),
        );

        nameController.clear();
        emailController.clear();
        phoneController.clear();
        typeController.clear();
        messageController.clear();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send message: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 2, // Reclamation tab
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Need help?\nFor any complaints or information requests,\ncall us at 0770 25 00 00 or fill out the form below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildTextField(nameController, "Name"),
                    _buildTextField(emailController, "Email"),
                    _buildTextField(phoneController, "Phone"),
                    _buildTextField(typeController, "Type of Insurance"),
                    _buildTextField(messageController, "Message", maxLines: 5),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: _submitForm,
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (value) => (value == null || value.isEmpty) ? 'Please enter $label' : null,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
