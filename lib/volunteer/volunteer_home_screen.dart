import 'package:flutter/material.dart';
import 'tabs/tasks_tab.dart';
import 'tabs/profile_tab.dart';

class VolunteerHomeScreen extends StatefulWidget {
  const VolunteerHomeScreen({super.key});

  @override
  _VolunteerHomeScreenState createState() => _VolunteerHomeScreenState();
}

class _VolunteerHomeScreenState extends State<VolunteerHomeScreen> {
  int _selectedIndex = 0;

  // Define the tabs
  final List<Widget> _tabs = [
    _buildHomeTab(),
    TasksTab(),  // Add the TasksTab here
    VolunteerProfileTab(),  // Add this line
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F1),
      appBar: AppBar(
        title: const Text(
          'FoodShare Volunteer',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Implement notifications
            },
          ),
        ],
      ),
      body: _tabs[_selectedIndex], // Show the selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color(0xFF00796B),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Helper method to build the home tab
  static Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUrgentNeedsSection(),
          const SizedBox(height: 20),
          _buildStatsGrid(),
          const SizedBox(height: 20),
          _buildAvailableDonationsSection(),
        ],
      ),
    );
  }

  // Helper method to build the profile tab
  static Widget _buildProfileTab() {
    return const Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Keep existing helper methods for home tab sections
  static Widget _buildUrgentNeedsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.priority_high, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  'Urgent Needs',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00796B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildUrgentNeedItem(
              location: 'Community Center, Downtown',
              meals: 50,
              distance: '2.5 km',
              time: '2 hours',
            ),
            Divider(),
            _buildUrgentNeedItem(
              location: 'St. Mary\'s Shelter',
              meals: 30,
              distance: '3.8 km',
              time: '3 hours',
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildUrgentNeedItem({
    required String location,
    required int meals,
    required String distance,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$meals meals needed'),
              Text(distance),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _buildStatsGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding around the grid
      child: SingleChildScrollView(
        child: GridView.count(
          shrinkWrap: true, // Prevent GridView from expanding infinitely
          physics: NeverScrollableScrollPhysics(), // Disable scrolling for GridView; managed by parent
          crossAxisCount: 2,
          mainAxisSpacing: 12, // Reduce spacing
          crossAxisSpacing: 12,
          childAspectRatio: 1.5, // Adjust as per available space
          children: [
            _buildStatCard(
              title: 'Meals Shared',
              value: '1,234',
              subtitle: 'Last Month',
              icon: Icons.restaurant,
            ),
            _buildStatCard(
              title: 'Lives Impacted',
              value: '5,678',
              subtitle: 'Total',
              icon: Icons.people,
            ),
            _buildStatCard(
              title: 'Active Donors',
              value: '89',
              subtitle: 'This Month',
              icon: Icons.volunteer_activism,
            ),
            _buildStatCard(
              title: 'Food Donated',
              value: '2.5t',
              subtitle: 'Total',
              icon: Icons.inventory_2,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 24),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }


  static Widget _buildAvailableDonationsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Donations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00796B),
              ),
            ),
            SizedBox(height: 16),
            _buildDonationItem(
              name: 'Fresh Vegetables',
              quantity: '50 kg',
              location: 'Central Market',
              expiryTime: '4 hours',
            ),
            Divider(),
            _buildDonationItem(
              name: 'Cooked Meals',
              quantity: '75 meals',
              location: 'Hotel Grand',
              expiryTime: '2 hours',
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildDonationItem({
    required String name,
    required String quantity,
    required String location,
    required String expiryTime,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(location),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                quantity,
                style: TextStyle(
                  color: Color(0xFF00796B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Expires in $expiryTime',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const VolunteerHomeScreen(), // Set the home screen
    );
  }
}
