import 'package:flutter/material.dart';
import '../forms/donation_form.dart';

class DonateTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Donate Food',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
            ),
          ),
          SizedBox(height: 20),
          _buildDonationCard(
            'Donate Cooked Food',
            Icons.restaurant,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonationForm(
                    donationType: 'Cooked Food',
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          _buildDonationCard(
            'Donate Raw Ingredients',
            Icons.kitchen,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonationForm(
                    donationType: 'Raw Ingredients',
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          _buildDonationCard(
            'Donate Packaged Food',
            Icons.inventory_2,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DonationForm(
                    donationType: 'Packaged Food',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDonationCard(String title, IconData icon, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                icon,
                size: 32,
                color: Color(0xFF00796B),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}