import 'package:flutter/material.dart';
import 'package:my_app/screens/base_scaffold.dart';
import 'package:my_app/theme/app_color.dart';

class Voyage extends StatelessWidget {
  const Voyage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      currentIndex: 0, // Affiche l'onglet "Home" sélectionné
      body: VoyageContent(),
    );
  }
}

class VoyageContent extends StatelessWidget {
  const VoyageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset('assets/travel.png'), // Assure-toi que cette image est dans pubspec.yaml
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Travel Insurance\n\n"
              "Our travel insurance covers unexpected events like illness, lost luggage, or missed flights—so you can travel with peace of mind.",
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
              "• Trip cancellation\n"
              "• Medical transportation and expenses\n"
              "• Pharmaceutical and hospitalization costs\n"
              "• Extended stay (up to 8 days)\n"
              "• Repatriation of remains and other beneficiaries\n"
              "• Flight delays and delayed baggage delivery\n"
              "• Lost baggage (up to 40 kg)\n"
              "• Missed connections\n"
              "• Rescue and emergency expenses\n"
              "• Legal assistance and advance of bail bond",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.background,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
