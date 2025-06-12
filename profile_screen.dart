import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/screens/base_scaffold.dart';
import 'package:my_app/theme/app_color.dart';
import 'notification_screen.dart';
import 'edit_profile.dart';
import 'insurance.dart';
import 'map.dart';
import 'login_screen.dart'; // Assure-toi que ce fichier existe

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 3, // Onglet "Profile"
      body: const ProfileContent(),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/profile_pic.png'),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  '@username',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: AppColors.primary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfile()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          sectionTitle("My Profile Info"),
          const SizedBox(height: 10),

          sectionItem(
            title: "My Insurance",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Insurance()),
              );
            },
          ),
          sectionItem(
            title: "Location",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MapWidget()),
              );
            },
          ),
          sectionItem(title: "Email Address"),
          sectionItem(title: "Phone Number"),
          const SizedBox(height: 30),

          //  Bouton de déconnexion
          ElevatedButton.icon(
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout, color: AppColors.background),
            label: const Text("Log Out"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accent,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget sectionItem({
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    Color backgroundColor = AppColors.background,
    Color textColor = AppColors.primary,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(color: textColor.withOpacity(0.8)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
