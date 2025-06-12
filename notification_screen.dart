import 'package:flutter/material.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/base_scaffold.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      currentIndex: 0, // ou autre selon ta logique
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/no_notifications.png', // assure-toi que l'image est bien dans assets
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'No new notifications',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
