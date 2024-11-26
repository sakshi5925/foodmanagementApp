import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final supabase = Supabase.instance.client;
  User? user;

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    setState(() {
      user = supabase.auth.currentUser;
    });
  }

  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
      Navigator.of(context).pushReplacementNamed('/oauth');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFF00796B),
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            // username
            user!.userMetadata?['full_name'] ?? 'Fetching user details...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user!.email ?? 'Fetching user details...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
//           Text(
//             user?.email ?? 'Fetching user details...',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
          SizedBox(height: 32),
          _buildProfileOption(
            'My Donations',
            Icons.history,
                () {
              // Navigate to donations history
            },
          ),
          _buildProfileOption(
            'Settings',
            Icons.settings,
                () {
              // Navigate to settings
            },
          ),
          _buildProfileOption(
            'Help & Support',
            Icons.help,
                () {
              // Navigate to help
            },
          ),
          _buildProfileOption(
            'Logout',
            Icons.exit_to_app,
            _signOut,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFF00796B)),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}


// import 'package:flutter/material.dart';
//
// class ProfileTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 50,
//             backgroundColor: Color(0xFF00796B),
//             child: Icon(
//               Icons.person,
//               size: 50,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 16),
//           Text(
//             'John Doe',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Text(
//             'john.doe@example.com',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(height: 32),
//           _buildProfileOption(
//             'My Donations',
//             Icons.history,
//             () {
//               // Navigate to donations history
//             },
//           ),
//           _buildProfileOption(
//             'Settings',
//             Icons.settings,
//             () {
//               // Navigate to settings
//             },
//           ),
//           _buildProfileOption(
//             'Help & Support',
//             Icons.help,
//             () {
//               // Navigate to help
//             },
//           ),
//           _buildProfileOption(
//             'Logout',
//             Icons.exit_to_app,
//             () {
//               // Handle logout
//               Navigator.of(context).pushReplacementNamed('/login');
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProfileOption(String title, IconData icon, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: Color(0xFF00796B)),
//       title: Text(title),
//       trailing: Icon(Icons.arrow_forward_ios, size: 16),
//       onTap: onTap,
//     );
//   }
// }