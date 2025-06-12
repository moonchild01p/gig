import 'package:flutter/material.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/base_scaffold.dart'; // Mets le bon chemin si différent

class HomeRisk extends StatelessWidget {
  const HomeRisk({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 1, // Correspond à l’onglet "About" dans la BottomNav
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/home_risk1.png'),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Home Multi-Risk Insurance\n\n"
                "Whether you own or rent a house or apartment, our insurance provides essential coverage to protect your property and safeguard your assets.",
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
                    "What coverage is offered?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "• Fire & related events\n"
                    "• Theft\n"
                    "• Water damage\n"
                    "• Glass breakage\n"
                    "• Liability\n"
                    "• Natural disasters\n\n"
                    "Protect your property by choosing one of the following plans:\n"
                    "• Classic Home Multi-Risk Insurance\n"
                    "• Home Rate Insurance “RANI M’HEMMI FI DARI”\n"
                    "• Individual Housing Plan (PLI)\n"
                    "• Collectivite Housing Plan (PLC)",
                    style: TextStyle(fontSize: 16, height: 1.5, color: AppColors.background),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Home Assistance\n\n"
                "Your pipes burst and you can’t find a plumber?\n"
                "You’re having trouble with your door lock?\n"
                "A window in your home is shattered?\n\n"
                "GIG ALGERIA offers Home Multi-Risk Insurance contracts that include Home Assistance services:\n"
                "• Plumbing issues\n"
                "• Broken glass\n"
                "• Electrical breakdowns\n"
                "• Broken or blocked keys",
                style: TextStyle(fontSize: 16, color: AppColors.primary, height: 1.5),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/home_risk2.png'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
