import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/base_scaffold.dart';

class Moto extends StatelessWidget {
  const Moto({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return BaseScaffold(
      currentIndex: 1, // Index 1 = About
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  'assets/moto.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Motorcycle Insurance\n\n"
                "Passionate about motorcycles? Get full protection with our insurance offering both basic and optional coverage.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's Covered",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Our motorcycle insurance includes:\n"
                    "• Civil liability for third-party damages\n"
                    "• Legal defense and claims assistance\n"
                    "• Coverage for motorcycle damage (with or without collision)\n"
                    "• Protection for rider's equipment\n"
                    "• Fire damage coverage\n"
                    "• Roadside assistance and support\n\n"
                    "The Advantages of GIG ALGERIA's Offer\n\n"
                    "• Comprehensive coverage for all engine sizes\n"
                    "• Protection for both rider and motorcycle\n"
                    "• Flexible pricing based on usage\n"
                    "• Covers third-party damages",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: AppColors.background,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
