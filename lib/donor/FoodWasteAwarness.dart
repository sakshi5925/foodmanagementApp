import 'package:flutter/material.dart';

class FoodWasteAwarness extends StatelessWidget {
  // Sample Data
  final List<Map<String, String>> statistics = [
    {
      'title': '1.3 Billion Tons',
      'subtitle': 'Food is wasted annually worldwide.',
      'icon': '🍽',
    },
    {
      'title': '\$1 Trillion',
      'subtitle': 'Economic loss due to food waste.',
      'icon': '💸',
    },
    {
      'title': '800 Million People',
      'subtitle': 'People facing hunger globally.',
      'icon': '👥',
    },
  ];

  final List<Map<String, String>> impacts = [
    {
      'title': 'Greenhouse Gas Emissions',
      'description':
      'Decomposing food waste generates methane, a potent greenhouse gas contributing to climate change.',
      'icon': '🌍',
    },
    {
      'title': 'Water Waste',
      'description':
      'Significant amounts of water are used in producing food that ultimately gets wasted.',
      'icon': '💧',
    },
    {
      'title': 'Land Use',
      'description':
      'Land resources are utilized for growing food that is never consumed, leading to habitat loss.',
      'icon': '🌾',
    },
  ];

  final List<Map<String, String>> tips = [
    {
      'title': 'Plan Your Meals',
      'description':
      'Create a weekly meal plan and shopping list to avoid buying excess food.',
      'icon': '📅',
    },
    {
      'title': 'Proper Storage',
      'description':
      'Store fruits, vegetables, and other perishables correctly to extend their shelf life.',
      'icon': '🥦',
    },
    {
      'title': 'Understand Expiry Dates',
      'description':
      'Learn the difference between "sell by," "use by," and "best before" dates to reduce confusion.',
      'icon': '🕒',
    },
    {
      'title': 'Use Leftovers',
      'description':
      'Get creative with leftovers to create new meals instead of discarding them.',
      'icon': '🍲',
    },
    {
      'title': 'Compost Food Scraps',
      'description':
      'Compost organic waste to enrich soil and reduce landfill burden.',
      'icon': '🌱',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Waste Awareness',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFFA6DFF3), // Light blue background
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF009688), // Teal background
          titleTextStyle: TextStyle(
            color: Colors.white, // White title text
            fontSize: 22, // Reduced font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Waste Awareness'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Back icon
            onPressed: () {
              Navigator.pop(context); // Functionality to go back
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFA6DFF3), // Light blue color
                  Color(0xFFAAF0D1), // Soft green color
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Infographic Statistics Section
                  SectionTitle(title: 'Infographic Statistics on Food Waste'),
                  SizedBox(height: 10),
                  InfographicStatistics(statistics: statistics),
                  SizedBox(height: 30),

                  // Environmental Impacts Section
                  SectionTitle(title: 'Environmental Impacts of Food Waste'),
                  SizedBox(height: 10),
                  EnvironmentalImpacts(impacts: impacts),
                  SizedBox(height: 30),

                  // Tips Section
                  SectionTitle(title: 'Tips to Reduce Food Waste at Home'),
                  SizedBox(height: 10),
                  FoodWasteTips(tips: tips),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20, // Reduced font size
          fontWeight: FontWeight.bold,
          color: Colors.green[700],
        ),
      ),
    );
  }
}

class InfographicStatistics extends StatelessWidget {
  final List<Map<String, String>> statistics;

  const InfographicStatistics({required this.statistics});

  @override
  Widget build(BuildContext context) {
    // Set a fixed height for the cards
    const double cardHeight = 220.0; // Increased height

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: statistics.map((stat) {
        return Expanded(
          child: Container(
            height: cardHeight, // Set fixed height
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 6,
                ),
              ],
            ),
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center, // Center contents vertically
                children: [
                  Text(
                    stat['icon']!,
                    style: TextStyle(fontSize: 28), // Adjusted icon size
                  ),
                  SizedBox(height: 10),
                  Text(
                    stat['title']!,
                    style: TextStyle(
                      fontSize: 14, // Reduced title font size
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    stat['subtitle']!,
                    style: TextStyle(
                      fontSize: 12, // Reduced subtitle font size
                      color: Colors.green[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class EnvironmentalImpacts extends StatelessWidget {
  final List<Map<String, String>> impacts;

  const EnvironmentalImpacts({required this.impacts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: impacts.map((impact) {
        return Card(
          color: Colors.green[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Text(
              impact['icon']!,
              style: TextStyle(fontSize: 28), // Reduced icon size
            ),
            title: Text(
              impact['title']!,
              style: TextStyle(
                fontSize: 16, // Reduced title font size
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            subtitle: Text(
              impact['description']!,
              style: TextStyle(
                fontSize: 12, // Reduced description font size
                color: Colors.green[600],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class FoodWasteTips extends StatelessWidget {
  final List<Map<String, String>> tips;

  const FoodWasteTips({required this.tips});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tips.map((tip) {
        return Card(
          color: Colors.green[50],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: Text(
              tip['icon']!,
              style: TextStyle(fontSize: 28), // Reduced icon size
            ),
            title: Text(
              tip['title']!,
              style: TextStyle(
                fontSize: 16, // Reduced title font size
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            subtitle: Text(
              tip['description']!,
              style: TextStyle(
                fontSize: 12, // Reduced description font size
                color: Colors.green[600],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}