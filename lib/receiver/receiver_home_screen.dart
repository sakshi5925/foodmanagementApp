import 'package:flutter/material.dart';
import 'tabs/request_tab.dart';
import 'tabs/profile_tab.dart';

class ReceiverHomeScreen extends StatefulWidget {
  final bool isNGO;

  const ReceiverHomeScreen({Key? key, required this.isNGO}) : super(key: key);

  @override
  _ReceiverHomeScreenState createState() => _ReceiverHomeScreenState();
}

class _ReceiverHomeScreenState extends State<ReceiverHomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      RequestFoodTab(),
      ReceiverProfileTab(isNGO: widget.isNGO),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F1),
      appBar: AppBar(
        title: Text(
          widget.isNGO ? 'FoodShare NGO' : 'FoodShare Receiver',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF00796B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Request Food',
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
}
