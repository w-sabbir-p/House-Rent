import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PropertyDetailsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  void MySnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Container(
          color: Colors.blue.shade600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              _buildDrawerItem(Icons.home, "Home", selected: true),
              _buildDrawerItem(Icons.person_outline, "Profile"),
              _buildDrawerItem(Icons.location_on_outlined, "Nearby"),
              const Divider(color: Colors.white30, indent: 20, endIndent: 20),
              _buildDrawerItem(Icons.bookmark_border, "Bookmark"),
              _buildDrawerItem(Icons.notifications_none_outlined, "Notification"),
              _buildDrawerItem(Icons.message_outlined, "Message"),
              const Divider(color: Colors.white30, indent: 20, endIndent: 20),
              _buildDrawerItem(Icons.settings_outlined, "Setting"),
              _buildDrawerItem(Icons.help_outline, "Help"),
              _buildDrawerItem(Icons.power_settings_new_outlined, "Logout"),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              // Top row: Location + Notification
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text(
                            'Jakarta',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.notifications_none_outlined, size: 28),
                ],
              ),
              const SizedBox(height: 20),

              // Search bar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            'Search address, or near you',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Category
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategory("House", true),
                    _buildCategory("Apartment", false),
                    _buildCategory("Hotel", false),
                    _buildCategory("Villa", false),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Near from you title
              _buildSectionHeader("Near from you"),
              const SizedBox(height: 15),

              // Horizontal list of properties
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPropertyCard(
                      "Dreamsville House",
                      "Jl Sultan Iskandar Muda",
                      "1.8 km",
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PropertyDetailsPage()),
                        );
                      },
                    ),

                    _buildPropertyCard(
                      "Ascot House", "Jl Cilandak Tengah", "2.1 km",
                          () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PropertyDetailsPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Best for you
              _buildSectionHeader("Best for you"),
              const SizedBox(height: 15),
              _buildBestForYou("Orchard House", "Rp. 2,500,000 / Year", "6 Bedroom", "4 Bathroom"),
              const SizedBox(height: 15),
              _buildBestForYou("The Hollies House", "Rp. 2,000,000 / Year", "5 Bedroom", "2 Bathroom"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String title, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Text("See more", style: TextStyle(color: Colors.blue)),
      ],
    );
  }

  Widget _buildPropertyCard(
      String title, String address, String distance, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 8),
        width: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Replace Image with Container + Icon
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Icon(Icons.house, size: 40, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                address,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.blue),
                  const SizedBox(width: 4),
                  Text(
                    distance,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildBestForYou(String name, String price, String bed, String bath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(price, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.bed_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(bed),
                    const SizedBox(width: 10),
                    const Icon(Icons.bathtub_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(bath),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

  }

  Widget _buildDrawerItem(IconData icon, String title, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: selected
          ? BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(30)),
      )
          : null,
      child: ListTile(
        leading: Icon(icon, color: selected ? Colors.blue.shade600 : Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.blue.shade600 : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}
