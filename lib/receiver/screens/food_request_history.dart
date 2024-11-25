import 'package:flutter/material.dart';

class FoodRequestHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F2F1),
      appBar: AppBar(
        title: Text('Food Request History'),
        backgroundColor: Color(0xFF00796B),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _dummyRequests.length,
        itemBuilder: (context, index) {
          final request = _dummyRequests[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Request #${request.id}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      _buildStatusChip(request.status),
                    ],
                  ),
                  SizedBox(height: 12),
                  _buildInfoRow(Icons.restaurant, 'Food Type', request.foodType),
                  SizedBox(height: 8),
                  _buildInfoRow(Icons.people, 'Quantity', '${request.quantity} servings'),
                  SizedBox(height: 8),
                  _buildInfoRow(Icons.location_on, 'Delivery Address', request.address),
                  SizedBox(height: 8),
                  _buildInfoRow(Icons.access_time, 'Requested Time', request.requestedTime),
                  SizedBox(height: 8),
                  _buildInfoRow(Icons.calendar_today, 'Date', request.date),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    Color chipColor;
    switch (status.toLowerCase()) {
      case 'pending':
        chipColor = Colors.orange;
        break;
      case 'completed':
        chipColor = Colors.green;
        break;
      case 'cancelled':
        chipColor = Colors.red;
        break;
      default:
        chipColor = Colors.grey;
    }

    return Chip(
      label: Text(
        status,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: chipColor,
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Color(0xFF00796B)),
        SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // Dummy data for demonstration
  final List<_FoodRequest> _dummyRequests = [
    _FoodRequest(
      id: '001',
      foodType: 'Cooked Food',
      quantity: 50,
      address: '123 Main St, City',
      requestedTime: '12:30 PM',
      date: '2024-03-20',
      status: 'Pending',
    ),
    _FoodRequest(
      id: '002',
      foodType: 'Raw Ingredients',
      quantity: 100,
      address: '456 Oak Ave, Town',
      requestedTime: '2:00 PM',
      date: '2024-03-19',
      status: 'Completed',
    ),
    _FoodRequest(
      id: '003',
      foodType: 'Packaged Food',
      quantity: 75,
      address: '789 Pine Rd, Village',
      requestedTime: '10:00 AM',
      date: '2024-03-18',
      status: 'Cancelled',
    ),
  ];
}

class _FoodRequest {
  final String id;
  final String foodType;
  final int quantity;
  final String address;
  final String requestedTime;
  final String date;
  final String status;

  _FoodRequest({
    required this.id,
    required this.foodType,
    required this.quantity,
    required this.address,
    required this.requestedTime,
    required this.date,
    required this.status,
  });
} 