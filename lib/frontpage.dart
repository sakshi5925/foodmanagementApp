import 'package:flutter/material.dart';

import 'loginpage.dart';

class WasteFoodManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserSelectionPage(),
    );
  }
}

class UserSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.greenAccent.withOpacity(0.7),
                  Colors.blueAccent.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1567004008461-39f1f43b448c',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // App Logo/Image from URL with circular shape
                    ClipOval(
                      child: Image.network(
                        'https://thumbs.dreamstime.com/b/reduce-food-waste-people-cycle-sign-concept-illustration-design-over-white-background-53679665.jpg',
                        height: 150,
                        width: 150, // Set width equal to height for circular shape
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return Icon(
                            Icons.error,
                            size: 80,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    // App Title
                    Text(
                      'Welcome to FoodShare!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Choose how you want to help:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 40),
                    // Registration options wrapped in a separate column for better organization
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildRegistrationCard(
                          context: context,
                          imageUrl: 'https://media.istockphoto.com/id/1224414210/vector/food-donation-and-charity.jpg?s=1024x1024&w=is&k=20&c=sONU6KrYIMRq_MdrY2MkRwWVD5MLh56t3sMSs7pn99g=',
                          title: 'Donor Registration',
                          color: Colors.green,
                        ),
                        const SizedBox(height: 20),
                        _buildRegistrationCard(
                          context: context,
                          imageUrl: 'https://thenewcomer.ca/wp-content/uploads/2021/06/Volunteer2_AmandaOwusu_Image-min-scaled.jpg',
                          title: 'Volunteer Registration',
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 20),
                        _buildRegistrationCard(
                          context: context,
                          imageUrl: 'https://media.istockphoto.com/id/1252168178/vector/safe-delivery-at-home-during-coronavirus-covid-19-courier-man-and-customer-wearing-mask-with.jpg?s=612x612&w=is&k=20&c=_SweB8k9fmWlz34voctaPJcVdrxLL_gvfyM0Gs_SuPw=',
                          title: 'Receiver/NGO Registration',
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegistrationCard({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(userType: title)),
      ),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => 
                Icon(Icons.error, size: 80),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}