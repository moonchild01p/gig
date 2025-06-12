import 'package:flutter/material.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/base_scaffold.dart';

class NaturalRisk extends StatelessWidget {
  const NaturalRisk({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 1, // Index de la page About (ou autre selon ta logique)
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/natural_risk.png'), // Vérifie que l'image existe
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Natural Disaster Insurance\n\n"
                "What is Natural Disaster Insurance?\n"
                "Climate change causes yearly property damage and financial losses. Protect your assets with the right coverage.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: AppColors.primary),
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
              child: const Text(
                "Under Ordinance No. 03-12 of August 26, 2003, all property owners in Algeria, except the state, must have an insurance contract covering their property against natural disasters. The insurance covers the following natural disasters:\n\n"
                "• Earthquakes\n"
                "• Floods and mudslides\n"
                "• Storms and strong winds\n"
                "• Landslides",
                style: TextStyle(fontSize: 16, color: AppColors.background, height: 1.5),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
