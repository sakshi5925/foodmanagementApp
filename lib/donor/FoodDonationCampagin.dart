import 'package:flutter/material.dart';

class FoodDonationCampagin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Donation App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFE0E0E0), // Warm gray for the background
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          children: [
            Icon(Icons.volunteer_activism, color: Colors.white),
            SizedBox(width: 8),
            Text('Food Donation App', style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Color(0xFF00796B), // Updated app bar color to a darker teal
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFB3E5FC), // Soft light blue
              Color(0xFFA5D6A7), // Gentle green
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                FoodDonationCampaignContent(),
                SizedBox(height: 16),
                DonationStatistics(),
                SizedBox(height: 16),
                LearnMoreSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodDonationCampaignContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food Donation Campaign',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32), // Darker green for titles
            ),
          ),
          SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              'https://cdn.create.vista.com/downloads/87770fba-9fc5-4e87-8061-c52df8ade09d_640.jpeg',
              height: screenHeight * 0.4,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Center(child: Text('Image could not be loaded'));
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Importance of Food Donations in Reducing Waste:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32), // Darker green for titles
            ),
          ),
          Text(
            '• Food donations play a critical role in reducing food waste by redirecting surplus food to those in need.',
            style: TextStyle(fontSize: 16, color: Colors.black87), // Keeping this color
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Thank you for joining the campaign!'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00796B), // Updated button color to match header
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text('Join Our Campaign'),
          ),
        ],
      ),
    );
  }
}

class DonationStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistics Showing the Impact of Food Donation Campaigns:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32), // Darker green for titles
            ),
          ),
          SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildStatisticCard('1 Million+', 'Pounds of food rescued', Icons.food_bank, Color(0xFFB2DFDB)), // Light green
              _buildStatisticCard('75', 'Meals provided per 100 lbs', Icons.restaurant, Color(0xFFA5D6A7)), // Soft green
              _buildStatisticCard('100+', 'Local families helped', Icons.family_restroom, Color(0xFF80CBC4)), // Light teal
              _buildStatisticCard('200+', 'Volunteers involved', Icons.group, Color(0xFF4CAF50)), // Medium green
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticCard(String title, String subtitle, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: color,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.white),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class LearnMoreSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learn More About Food Donation:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32), // Darker green for titles
            ),
          ),
          SizedBox(height: 10),
          Text(
            '• Discover how food donations impact your community.',
            style: TextStyle(fontSize: 16, color: Colors.black87), // Keeping this color
          ),
          Text(
            '• Understand the process of food donation.',
            style: TextStyle(fontSize: 16, color: Colors.black87), // Keeping this color
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Navigating to Learn More!'),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF00796B), // Updated button color to match header
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text('Learn More'),
          ),
        ],
      ),
    );
  }
}