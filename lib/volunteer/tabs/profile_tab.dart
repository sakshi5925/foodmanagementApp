import 'package:flutter/material.dart';
import '../../receiver/screens/EditProfileScreen.dart';
import '../../receiver/screens/settings_page.dart';
import '../models/achievement.dart';
import '../models/contribution.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class VolunteerProfileTab extends StatefulWidget {
  @override
  _VolunteerProfileTab createState() => _VolunteerProfileTab();
}

class _VolunteerProfileTab extends State<VolunteerProfileTab> {
  // final String name = 'John Doe';
  // final String email = 'john.doe@example.com';
  final String phone = '+1 234-567-8900';
  final int tasksCompleted = 25;
  final int mealsDistributed = 1250;
  final int donationsCollected = 45;

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

  // Dummy data for achievements
  final List<Achievement> achievements = [
    Achievement(
      name: 'First Delivery',
      description: 'Completed first food delivery task',
      date: DateTime(2024, 1, 15),
      icon: Icons.local_shipping,
    ),
    Achievement(
      name: 'Food Hero',
      description: 'Distributed over 1000 meals',
      date: DateTime(2024, 2, 20),
      icon: Icons.restaurant,
    ),
    Achievement(
      name: 'Dedicated Volunteer',
      description: 'Completed 25 tasks',
      date: DateTime(2024, 3, 10),
      icon: Icons.volunteer_activism,
    ),
  ];

  // Dummy data for contributions
  final List<Contribution> contributions = [
    Contribution(
      type: 'Meal Delivery',
      quantity: 50,
      location: 'Downtown Community Center',
      date: DateTime(2024, 3, 15),
      impact: 'Fed 50 people',
    ),
    Contribution(
      type: 'Food Collection',
      quantity: 100,
      location: 'Local Restaurant',
      date: DateTime(2024, 3, 10),
      impact: 'Saved 100kg of food',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(context),
          SizedBox(height: 24),
          _buildActivitySummary(),
          SizedBox(height: 24),
          _buildAchievements(),
          SizedBox(height: 24),
          _buildContributions(),
          SizedBox(height: 24),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFF00796B),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xFF00796B),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, size: 18, color: Colors.white),
                    onPressed: () {
                      // Implement photo upload
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            user?.userMetadata?['full_name'] ?? 'Fetching user details...',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user?.email ?? 'Fetching user details...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            phone,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivitySummary() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00796B),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActivityItem(
                  Icons.task_alt,
                  tasksCompleted.toString(),
                  'Tasks\nCompleted',
                ),
                _buildActivityItem(
                  Icons.restaurant,
                  mealsDistributed.toString(),
                  'Meals\nDistributed',
                ),
                _buildActivityItem(
                  Icons.volunteer_activism,
                  donationsCollected.toString(),
                  'Donations\nCollected',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Color(0xFF00796B), size: 32),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00796B),
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildAchievements() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Achievements',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00796B),
              ),
            ),
            SizedBox(height: 16),
            ...achievements.map((achievement) => _buildAchievementItem(achievement)),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementItem(Achievement achievement) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF00796B).withOpacity(0.1),
            child: Icon(
              achievement.icon,
              color: Color(0xFF00796B),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  achievement.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  achievement.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${achievement.date.day}/${achievement.date.month}/${achievement.date.year}',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContributions() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Past Contributions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00796B),
              ),
            ),
            SizedBox(height: 16),
            ...contributions.map((contribution) => _buildContributionItem(contribution)),
          ],
        ),
      ),
    );
  }

  Widget _buildContributionItem(Contribution contribution) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                contribution.type,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${contribution.date.day}/${contribution.date.month}/${contribution.date.year}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            contribution.location,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quantity: ${contribution.quantity}',
                style: TextStyle(
                  color: Color(0xFF00796B),
                ),
              ),
              Text(
                contribution.impact,
                style: TextStyle(
                  color: Color(0xFF00796B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildProfileOption(
          'Edit Profile',
          Icons.edit,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfileScreen(),
              ),
            );
          },
        ),
        _buildProfileOption(
          'Settings',
          Icons.settings,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SettingsPage(isNGO: false,),
              ),
            );
          },
        ),
        _buildProfileOption(
          'Help & Support',
          Icons.help,
          () {
            // Navigate to help & support
          },
        ),
        _buildProfileOption(
          'Logout',
          Icons.exit_to_app,
          _signOut,
        ),
      ],
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