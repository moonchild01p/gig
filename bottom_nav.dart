import 'package:flutter/material.dart';
import '../theme/app_color.dart';

class Bottom_nav extends StatelessWidget {
  const Bottom_nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321,
      height: 43,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(21.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(Icons.home),
          _buildNavIcon(Icons.location_on),
          _buildNavIcon(Icons.help),
          _buildNavIcon(Icons.person),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon) {
    return IconButton(
      icon: Icon(
        icon,
        color: AppColors.white,
        size: 24,
      ),
      onPressed: () {},
    );
  }
}