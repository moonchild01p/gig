import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/theme/app_color.dart';
import 'package:my_app/screens/base_scaffold.dart';

class Insurance extends StatelessWidget {
  const Insurance({super.key});

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget dataSection(String collectionName, String? userId) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection(collectionName)
          .where('clientId', isEqualTo: userId)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(10),
            child: Text("Aucune donnée trouvée."),
          );
        }

        return Column(
          children: snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(data['title'] ?? 'No title'),
                subtitle: Text(data['description'] ?? 'No description'),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    return BaseScaffold(
      currentIndex: 0, // ou autre selon ta logique de navigation
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: userId == null
            ? const Center(child: Text("Utilisateur non connecté"))
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle("Policies"),
                    dataSection("Policies", userId),
                    const SizedBox(height: 30),
                    sectionTitle("Claims"),
                    dataSection("Claims", userId),
                    const SizedBox(height: 30),
                    sectionTitle("Payments"),
                    dataSection("Payments", userId),
                  ],
                ),
              ),
      ),
    );
  }
}
