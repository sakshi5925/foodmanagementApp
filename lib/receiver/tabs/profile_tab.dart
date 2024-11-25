import 'package:flutter/material.dart';
import '../screens/food_request_history.dart';
import '../screens/organization_details.dart';
import '../screens/settings_page.dart';

class ReceiverProfileTab extends StatelessWidget {
  final bool isNGO;

  const ReceiverProfileTab({Key? key, required this.isNGO}) : super(key: key);

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
              isNGO ? Icons.business : Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            isNGO ? 'NGO Name' : 'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isNGO ? 'ngo@example.com' : 'john.doe@example.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 32),
          if (isNGO) ...[
            _buildProfileOption(
              'Organization Details',
              Icons.info,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrganizationDetails(),
                  ),
                );
              },
            ),
            _buildProfileOption(
              'Food Requests History',
              Icons.history,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodRequestHistory(),
                  ),
                );
              },
            ),
          ] else ...[
            _buildProfileOption(
              'My Requests',
              Icons.history,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodRequestHistory(),
                  ),
                );
              },
            ),
            _buildProfileOption(
              'Family Members',
              Icons.family_restroom,
                  () {
                // Navigate to family members
              },
            ),
          ],
          _buildProfileOption(
            'Settings',
            Icons.settings,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(isNGO: isNGO),
                ),
              );
            },
          ),
          _buildProfileOption(
            'Logout',
            Icons.exit_to_app,
                () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
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
