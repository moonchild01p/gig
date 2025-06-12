import 'package:flutter/material.dart';
import 'package:my_app/screens/base_scaffold.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/auto.dart';
import 'package:my_app/screens/moto.dart';
import 'package:my_app/screens/voyage.dart';
import 'package:my_app/screens/natural_risk.dart';
import 'package:my_app/screens/pleasure_boat.dart';
import 'package:my_app/screens/professional_risk.dart';
import 'package:my_app/screens/home_risk.dart';

class Vitrine extends StatelessWidget {
  const Vitrine({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      currentIndex: 0, // L'index 0 correspond à "Home"
      body: VitrineBody(),
    );
  }
}

class VitrineBody extends StatelessWidget {
  const VitrineBody({super.key});

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
              child: Image.asset(
                'assets/alg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Discover our products',
            style: TextStyle(
              color: Color(0xFF1E096E),
              fontFamily: 'Oswald',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildProductCard(context, 'Auto', Icons.directions_car, const Auto()),
              _buildProductCard(context, 'Moto', Icons.motorcycle, const Moto()),
              _buildProductCard(context, 'Voyage', Icons.card_travel, const Voyage()),
              _buildProductCard(context, 'Natural Risk', Icons.nature, const NaturalRisk()),
              _buildProductCard(context, 'Pleasure Boat', Icons.directions_boat, const PleasureBoat()),
              _buildProductCard(context, 'Professional Risk', Icons.business_center, const ProfessionalRisk()),
              _buildProductCard(context, 'Home Risk', Icons.home_work, const HomeRisk()),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String label, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: AppColors.secondary,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
