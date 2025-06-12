import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/screens/profile_screen.dart';
import 'package:my_app/theme/app_color.dart';
import 'notification_screen.dart';

import 'map.dart';
import 'vitrine.dart';
import 'package:my_app/screens/about.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isLoading = true;
  int _selectedIndex = 3;

  final List<Widget> _pages = [
    const Vitrine(),
    const About(),
    MapWidget(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _loadClientData();
  }

  Future<void> _loadClientData() async {
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('Client')
          .doc(user!.uid)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        _nameController.text = data['Name'] ?? '';
        _emailController.text = data['Email'] ?? '';
        _phoneController.text = data['Phone'] ?? '';
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    if (user != null) {
      await FirebaseFirestore.instance.collection('Client').doc(user!.uid).set({
        'Name': _nameController.text,
        'Email': _emailController.text,
        'Phone': _phoneController.text,
        'Client ID': user!.uid,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => _pages[index]),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primary),
        title: Image.asset('assets/algeria.png', height: 50),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.primary),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationScreen()));
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // À implémenter plus tard
                      },
                      child: Column(
                        children: [
                          const Text(
                            "Changer la photo de profil",
                            style: TextStyle(color: AppColors.primary),
                          ),
                          const SizedBox(height: 10),
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/profile_pic.png'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    buildTextField(_nameController, "Name"),
                    const SizedBox(height: 15),
                    buildTextField(_emailController, "Email"),
                    const SizedBox(height: 15),
                    buildTextField(_phoneController, "Phone Number"),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _saveProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: AppColors.background, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primary,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.background,
        unselectedItemColor: AppColors.background.withOpacity(0.6),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      validator: (value) => value == null || value.isEmpty ? 'Ce champ est requis' : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }
}
