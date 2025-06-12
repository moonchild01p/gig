import 'package:flutter/material.dart';
import 'package:my_app/screens/base_scaffold.dart';
import 'package:my_app/theme/app_color.dart';

class Auto extends StatelessWidget {
  const Auto({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      currentIndex: 0,
      body: AutoContent(),
    );
  }
}

class AutoContent extends StatelessWidget {
  const AutoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/auto_main.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Drive with peace of mind!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Your vehicle deserves the best insurance. We offer flexible plans and tailored coverage to fit your needs and budget.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ),
          const SizedBox(height: 30),

          buildContainer(
            title: "Benefits\n(Accident, theft, breakdown...)",
            titleColor: AppColors.primary,
            content:
                "Thoughtful coverage.\nRates tailored to your budget.\nLoyalty rewarded.\nExtensive roadside assistance.\nAccess to our repair network for glass breakage.\nAssistance or towing, even at home.\nWe cover repair costs.",
            backgroundColor: AppColors.lightBlue,
          ),

          buildContainer(
            title: "General Conditions\nOur guarantees for better protection:",
            content:
                "Unlimited third-party liability: Coverage for damages you cause to others.\n"
                "Legal defense and claims: Protection of your rights in case of a dispute after an accident.\n"
                "Transported persons: Coverage for injuries or death of passengers in an accident.\n"
                "Damage: Coverage for all damage to your vehicle from an accident.",
            backgroundColor: AppColors.lightBlue,
          ),

          buildContainer(
            title: "Theft and fire",
            content:
                "Compensation for vehicle damage or loss due to fire or theft.\n"
                "Glass breakage: Coverage for damage to windows, including windshields and rear windows.\n"
                "Theft of items: Compensation for stolen vehicle accessories.\n"
                "Roadside assistance: Various assistance plans, including:\n"
                "Towing\nDelivery of fuel, engine oil, and coolant\nTire replacement\nReplacement vehicle\nAssistance for individuals",
            backgroundColor: AppColors.lightBlue,
          ),

          buildContainer(
            title: "Your car insurance remains valid even in Tunisia!",
            content:
                "Since your vehicle is essential in every moment of your life, we offer full coverage, even while you're on vacation in Tunisia. Simply pre-declare via tuneasy@gig.dz to receive compensation for any damages incurred in Tunisia.",
            backgroundColor: const Color.fromARGB(255, 246, 234, 179),
          ),

          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              'assets/auto_bottom.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildContainer({
    required String title,
    required String content,
    Color backgroundColor = AppColors.lightBlue,
    Color titleColor = Colors.black,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(fontSize: 15, height: 1.5),
          ),
        ],
      ),
    );
  }
}
