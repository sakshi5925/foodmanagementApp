import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class OrganizationDetails extends StatefulWidget {
  @override
  _OrganizationDetailsState createState() => _OrganizationDetailsState();
}

class _OrganizationDetailsState extends State<OrganizationDetails> {
  bool _isLoading = false;
  Position? _currentPosition;

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location shared successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sharing location: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F2F1),
      appBar: AppBar(
        title: Text('Organization Details'),
        backgroundColor: Color(0xFF00796B),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Organization Information',
              [
                _buildInfoRow('Name', 'Food Share NGO'),
                _buildInfoRow('Registration No.', 'NGO123456'),
              ],
            ),
            SizedBox(height: 20),
            _buildSection(
              'Contact Information',
              [
                _buildInfoRow('Phone', '+1 234-567-8900'),
                _buildInfoRow('Email', 'contact@foodsharengo.org'),
                _buildInfoRow('Website', 'www.foodsharengo.org'),
              ],
            ),
            SizedBox(height: 20),
            _buildSection(
              'Address',
              [
                _buildInfoRow('Street', '123 Food Share Street'),
                _buildInfoRow('City', 'Charity City'),
                _buildInfoRow('State', 'CS'),
                _buildInfoRow('ZIP', '12345'),
              ],
            ),
            SizedBox(height: 20),
            _buildSection(
              'Mission Statement',
              [
                Text(
                  'Our mission is to reduce food waste and hunger by connecting food donors with those in need. We strive to create a sustainable and equitable food distribution system in our community.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            if (_currentPosition != null)
              _buildSection(
                'Current Location',
                [
                  _buildInfoRow('Latitude', _currentPosition!.latitude.toString()),
                  _buildInfoRow('Longitude', _currentPosition!.longitude.toString()),
                ],
              ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _getCurrentLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00796B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: _isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Icon(Icons.location_on),
                label: Text(
                  _isLoading ? 'Sharing Location...' : 'Share Location',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00796B),
              ),
            ),
            SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 