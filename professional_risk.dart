import 'package:flutter/material.dart';
import 'package:my_app/screens/base_scaffold.dart'; // Assure-toi que ce fichier existe
import 'package:my_app/theme/app_color.dart';

class ProfessionalRisk extends StatelessWidget {
  const ProfessionalRisk({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 1, // Index de la page About, modifie si besoin
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/risque_prof1.png'),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Professional Multi-Risk Insurance\n\n"
                "Work in a liberal profession? Protect your business with Professional Multi-Risk Insurance—covering liability, premises, equipment, and more, with customizable options to fit your needs.",
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
              child: const Text(
                "Find the coverage designed for you:\n\n"
                "• Fire & related events: Covers buildings, equipment, and goods\n"
                "• Theft & property damage\n"
                "• Glass breakage\n"
                "• Operating civil liability\n"
                "• Legal protection\n"
                "• Optional coverage: professional liability, product liability, etc.",
                style: TextStyle(fontSize: 16, color: AppColors.background, height: 1.5),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Who is covered by this insurance?\n\n"
                "Applies to: craftsmen, merchants, liberal professionals, etc.\n\n"
                "Advantages:\n"
                "• One contract for all risks\n"
                "• Tailor-made protection\n"
                "• Comprehensive assistance packages",
                style: TextStyle(fontSize: 16, color: AppColors.primary, height: 1.5),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/risque_prof2.png'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
