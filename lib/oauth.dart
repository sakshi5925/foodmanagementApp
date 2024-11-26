import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'donor/donor_home_screen.dart'; // Donor's home screen
import 'volunteer/volunteer_home_screen.dart'; // Volunteer's home screen
import 'receiver/receiver_home_screen.dart'; // Receiver/NGO home screen

import 'main.dart';

class SupabaseAuthPage extends StatefulWidget {
  final String userType;
  const SupabaseAuthPage({Key? key, required this.userType}) : super(key: key);

  @override
  _SupabaseAuthPageState createState() => _SupabaseAuthPageState();
}

class _SupabaseAuthPageState extends State<SupabaseAuthPage> {
  String? _userId;

  @override
  // void initState() {
  //   super.initState();
  //
  //   // Initialize Supabase Auth Listener
  //   supabase.auth.onAuthStateChange.listen((event) {
  //     setState(() {
  //       _userId = event.session?.user?.id;
  //     });
  //   });
  // }
  void initState() {
    super.initState();

    // Initialize Supabase Auth Listener
    supabase.auth.onAuthStateChange.listen((event) {
      final userId = event.session?.user?.id;
      setState(() {
        _userId = userId;
      });

      if (userId != null) {
        // Replace with your logic to determine user type
        // String userType = 'Donor'; // Default to Donor
        String userType = widget.userType;
        // Navigate to respective screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (userType == 'Donor Registration') {
                return DonorHomeScreen();
              } else if (userType == 'Volunteer Registration') {
                return VolunteerHomeScreen();
              } else if (userType == 'Receiver/NGO Registration') {
                return ReceiverHomeScreen(isNGO: true); // Update as necessary
              } else {
                return Scaffold(
                  body: Center(
                    child: Text('Unknown user type: $userType'),
                  ),
                );
              }
            },
          ),
        );
      }
    });
  }

  Future<void> _nativeGoogleSignIn() async {
    const iosClientId = '299659495054-rdm0g0n50ojm77hvud952sm8gkbltcjl.apps.googleusercontent.com';
    const webClientId = '299659495054-1il7ki8tdl5me7tuf5tcapaf5avvp0v9.apps.googleusercontent.com';

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw 'Sign-in aborted by user.';
      }

      final googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw 'Authentication failed. Missing tokens.';
      }

      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
        accessToken: googleAuth.accessToken!,
      );
      print('Google Sign-in successful');
    } catch (error) {
      print('Error during Google sign-in: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SVG Background
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/background.svg',
              fit: BoxFit.cover,
            ),
          ),
          // Sign-up Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _nativeGoogleSignIn,
                  icon: SvgPicture.asset(
                    'assets/google_logo.svg',
                    height: 30,
                    width: 30,
                  ),
                  label: Text('Sign up with Google'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(title: Text('Supabase Authentication')),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         if (_userId != null)
    //           Text('Signed in as User ID: $_userId')
    //         else
    //           ElevatedButton(
    //             onPressed: _nativeGoogleSignIn,
    //             child: Text('Sign in with Google'),
    //           ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
