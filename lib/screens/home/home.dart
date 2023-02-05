import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('Brew Crew'),
        elevation: 0.0,
        actions: [
          TextButton.icon(
              onPressed: () async => await auth.signOut(),
              icon: const Icon(Icons.person),
              label: const Text('Logout'))
        ],
      ),
      body: const Text('Home'),
    );
  }
}
