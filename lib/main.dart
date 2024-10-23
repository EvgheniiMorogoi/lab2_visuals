// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorAppScreen(),
    );
  }
}

class DoctorAppScreen extends StatelessWidget {
  const DoctorAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.location_on, color: Colors.black),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Seattle, USA',
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search doctor...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),

// Promotional Banner
Container(
  width: double.infinity,
  height: 200, // Adjust height to match your design
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    image: DecorationImage(
      image: AssetImage('assets/icons/looking_for.png'), // Use the asset image as the background
      fit: BoxFit.cover,
    ),
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Increase blur for effect
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5), // Dark overlay for contrast
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
          children: [
            Text(
              'Looking for Specialist Doctors?',
              style: TextStyle(
                fontSize: 24, // Increase font size for visibility
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Schedule an appointment with our top doctors.',
              style: TextStyle(
                fontSize: 16, // Adjust font size for subtitle
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),


              // Categories Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Category Grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                childAspectRatio: 3 / 4,
                children: [
                  categoryCard(Icons.local_hospital, 'Dentistry', Colors.pink.shade100),
                  categoryCard(Icons.favorite, 'Cardiology', Colors.green.shade100),
                  categoryCard(Icons.air, 'Pulmonology', Colors.orange.shade100),
                  categoryCard(Icons.healing, 'General', Colors.purple.shade100),
                  categoryCard(FontAwesomeIcons.brain, 'Neurology', Colors.teal.shade100),
                  categoryCard(FontAwesomeIcons.brain, 'Gastroenterology', Colors.deepPurple.shade100),
                  categoryCard(Icons.science, 'Laboratory', Colors.red.shade100),
                  categoryCard(Icons.vaccines, 'Vaccination', Colors.lightBlue.shade100),
                ],
              ),
              SizedBox(height: 16),

              // Nearby Medical Centers Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearby Medical Centers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Horizontal Medical Centers List
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    medicalCenterCard('Sunrise Health Clinic', '5.0',
                        '58 Reviews', 'Hospital', '2.5 km/40min', 'assets/icons/prima_laboratorie.png'),
                    medicalCenterCard('Golden Cardiology', '4.9', '108 Reviews',
                        'Hospital', '2.5 km/40min', 'assets/icons/a_doua_laboratorie.png'),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Doctor List Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '532 founds',
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.sort),
                ],
              ),
              SizedBox(height: 16),

              // Doctor List Vertical
              doctorListCard(
                  'Dr. David Patel',
                  'Cardiologist',
                  'Cardiology Center, USA',
                  '5.0',
                  '1872 Reviews',
                  Colors.pink.shade100,
                  'assets/icons/david_patel.png'),
              doctorListCard(
                  'Dr. Jessica Turner',
                  'Gynecologist',
                  'Women\'s Clinic, Seattle',
                  '4.9',
                  '127 Reviews',
                  Colors.orange.shade100,
                  'assets/icons/jessica_turner.png'),
              doctorListCard(
                  'Dr. Michael Johnson',
                  'Orthopedic Surgery',
                  'Maple Associates, NY',
                  '4.7',
                  '5223 Reviews',
                  Colors.green.shade100,
                  'assets/icons/Michael_johnson.png'),
              doctorListCard(
                  'Dr. Emily Walker',
                  'Pediatrics',
                  'Serenity Pediatrics Clinic',
                  '5.0',
                  '405 Reviews',
                  Colors.pink.shade100,
                  'assets/icons/emily_walker_1.png'),
              doctorListCard(
                  'Dr. Emily Walker',
                  'Pediatrics',
                  'Serenity Pediatrics Clinic',
                  '5.0',
                  '405 Reviews',
                  Colors.pink.shade100,
                  'assets/icons/emily_walker_2.png'),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Method for Categories
  Widget categoryCard(IconData icon, String label, Color bgColor) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 28),
        ),
        SizedBox(height: 8),
        Text(label, overflow: TextOverflow.ellipsis),
      ],
    );
  }

  // Helper Method for Medical Centers
  Widget medicalCenterCard(String name, String rating, String reviews,
      String type, String distance, String imagePath) {
    return Container(
      width: 220,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.1))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: AssetImage(imagePath), // Use the asset image
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Text(' $rating '),
                    Text('($reviews)'),
                  ],
                ),
                Text(type),
                Text(distance),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Method for Doctor List
  Widget doctorListCard(String name, String specialization, String clinic,
      String rating, String reviews, Color bgColor, String imagePath) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: bgColor,
          backgroundImage: AssetImage(imagePath), // Use the asset image
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialization),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                Text(' $rating '),
                Text('($reviews)'),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.favorite_border),
      ),
    );
  }
}
