import 'package:flutter/material.dart';
import 'package:my_app/screens/base_scaffold.dart'; // Assure-toi que c'est bien le chemin correct
import 'package:my_app/theme/app_color.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 1,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/about_header.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'GIG-Algeria was founded in 1998 as “2a” with 100% Algerian capital, offering various insurance services. In 2011, it specialized in property and casualty insurance due to regulatory changes. In 2015, Gulf Insurance Group, a major MENA insurer backed by FAIRFAX, became a shareholder. The company rebranded as GIG-Algeria in 2021, adopting GIG’s vision and values. It is now committed to excellent customer service, responsible practices, and being a top employer.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            _buildInfoCard("Our\nVision", "To lead a high-quality insurance system."),
            const SizedBox(height: 20),
            _buildInfoCard("Our\nMission", "We invest to delight customers, retain talent, support partners, and serve our communities."),
            const SizedBox(height: 20),
            _buildInfoCard("Our\nValues", "Integrity, innovation, and service excellence."),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/about_footer.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF978ECB),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFF9F6E6),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                color: Color(0xFFF9F6E6),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
