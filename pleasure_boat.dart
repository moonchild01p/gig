import 'package:flutter/material.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/base_scaffold.dart';

class PleasureBoat extends StatelessWidget {
  const PleasureBoat({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 1, // ou l’index correct selon ta logique de navigation
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/pleasure_boat.png'),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Pleasure Boat Insurance\n\n"
                "Choose the right coverage and high-quality protection to sail with peace of mind and fully enjoy your time at sea.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: AppColors.primary),
              ),
            ),
            const SizedBox(height: 20),
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
                    "We offer the following coverage:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "• Loss and damage while sailing, docked, or stored on land\n"
                    "• Assistance – Rescue – Removal and refloating\n"
                    "• Total theft\n"
                    "• Third-party liability",
                    style: TextStyle(fontSize: 16, height: 1.5, color: AppColors.background),
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
