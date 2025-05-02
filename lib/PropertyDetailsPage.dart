import 'package:flutter/material.dart';

class PropertyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Color(0xFF0054A5);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top House Image Placeholder
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Icon(Icons.home, size: 100, color: Colors.white70),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back, color: primaryColor),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.bookmark_border, color: primaryColor),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dreamsville House',
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Jl. Sultan Iskandar Muda, Jakarta Selatan',
                          style: TextStyle(color: Colors.white70),
                        ),
                        SizedBox(height: 16),
                        // Bedroom and Bathroom Info
                        Row(
                          children: [
                            Icon(Icons.king_bed_outlined, color: primaryColor),
                            SizedBox(width: 4),
                            Text('6 Bedroom'),
                            SizedBox(width: 16),
                            Icon(Icons.bathtub_outlined, color: primaryColor),
                            SizedBox(width: 4),
                            Text('4 Bathroom'),
                          ],
                        ),
                      ],

                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              SizedBox(height: 16),

              // Description
              Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text(
                'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 16),

              // Owner Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Garry Allen', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Owner'),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.phone, color: primaryColor),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline, color: primaryColor),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Gallery
              Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (_, __) => SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(Icons.image, color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),

              // Map
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(Icons.map, size: 60, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),

              // Price and Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price', style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 4),
                      Text('Rp. 2.500.000.000 / Year',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Rent Now', style: TextStyle(color: Colors.white, fontSize: 20),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
