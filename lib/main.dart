import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'frontpage.dart'; // Assuming you have this page
import 'loginpage.dart'; // Assuming you have this page
import 'oauth.dart'; // Assuming you have this page
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );

  runApp(WasteFoodManagementApp());
}

final supabase = Supabase.instance.client;

class WasteFoodManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => UserSelectionPage(), // Front page
        '/login': (context) => LoginPage(userType: 'Donor Registration'), // Login page with userType passed
        '/oauth': (context) => SupabaseAuthPage(userType: 'Donor Registration'), // OAuth page
        // '/oauth': (context) => OAuthPage(), // OAuth page
      },
    );
  }
}