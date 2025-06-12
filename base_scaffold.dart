import 'package:flutter/material.dart';
import 'package:my_app/screens/insurance.dart';
import 'package:my_app/screens/reclamation.dart';
import 'package:my_app/screens/vitrine.dart';
import 'package:my_app/screens/about.dart';
import 'package:my_app/screens/map.dart';
import 'package:my_app/screens/profile_screen.dart';

import 'package:my_app/screens/notification_screen.dart';
import 'package:my_app/theme/app_color.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;

  const BaseScaffold({
    super.key,
    required this.body,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;
    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Vitrine()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const About()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MapWidget()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Profile()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_pic.png'), // Ton image
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MapWidget()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified_user),
              title: const Text('My Insurance'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Insurance()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email: user@example.com'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone: +213 555 555 555'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.report_problem),
              title: const Text('Réclamation'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Reclamation()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.primary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        title: Image.asset('assets/algeria.png', height: 50),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: AppColors.primary),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationScreen()));
            },
          ),
        ],
      ),
      body: SafeArea(child: body),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: AppColors.background,
        unselectedItemColor: AppColors.background.withOpacity(0.6),
        backgroundColor: AppColors.primary,
        onTap: (index) => _onItemTapped(context, index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
