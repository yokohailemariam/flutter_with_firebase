import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Sign in anonymously'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: TextButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnonymously();
            if (result == null) {
              if (kDebugMode) {
                print('error signin');
              }
            } else {
              if (kDebugMode) {
                print('signed in ');
                print(result.uid);
              }
            }
          },
          child: const Text('Sign in'),
        ),
      ),
    );
  }
}
