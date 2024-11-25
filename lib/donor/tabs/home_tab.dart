import 'package:flutter/material.dart';
import '../FoodDonationCampagin.dart';
import '../FoodWasteAwarness.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, Donor!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
            ),
          ),
          SizedBox(height: 20),
          _buildOptionCard(
            context,
            'Donate Food',
            'Help reduce food waste by donating excess food',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUc5tFI98ti5JZ9YSZwkSRD_RXx0JLFiGdnNlIRstP7-DvxeZQX5bsIAwBR9mSi5URp5A&usqp=CAU',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDonationCampagin(),
                ),
              );
            },
          ),
          SizedBox(height: 30),
          _buildOptionCard(
            context,
            'Learn About Food Waste',
            'Understand the impact of food waste',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThmYDbgiKscJX0ur7UgkG6uNW3KeeQThTCSw&s',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodWasteAwarness(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(
    BuildContext context,
    String title,
    String description,
    String imageUrl,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(
                      height: 150,
                      color: Colors.grey[300],
                      child: Icon(Icons.error, size: 50),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00796B),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 