import 'package:Hush/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottom_navBar.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator if the authentication state is still loading
          return CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data != null) {
          // User is logged in, return the authenticated page
          return NavBar();
        } else {
          // User is not logged in, return the login page
          return Authpage();
        }
      },
    );
  }
}
