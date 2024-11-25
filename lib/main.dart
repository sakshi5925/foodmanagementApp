import 'package:flutter/material.dart';
import 'frontpage.dart'; // Assuming you have this page
import 'loginpage.dart'; // Assuming you have this page

void main() {
  runApp(WasteFoodManagementApp());
}

class WasteFoodManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => UserSelectionPage(), // Front page
        '/login': (context) => LoginPage(userType: 'Donor Registration'), // Login page with userType passed
      },
    );
  }
}
