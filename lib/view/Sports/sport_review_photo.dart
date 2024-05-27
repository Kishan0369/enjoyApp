import 'package:enjoy/view/Sports/sportsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';

// ItemInfo StatefulWidget
class SportInfo extends StatefulWidget {
  final SportsItem item;

  SportInfo({required this.item});

  @override
  _SportInfoState createState() => _SportInfoState();
}

// _ItemInfoState State
class _SportInfoState extends State<SportInfo> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Get current location method
  void _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Color(0xFF4E342E),
        automaticallyImplyLeading: false,
          toolbarHeight: 1,
    ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container with item image
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 270,
              child: Image.asset(
                widget.item.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),

            // Padding for spacing
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Item name
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          TextSpan(
                            text: widget.item.name,
                            style: GoogleFonts.merriweatherSans(
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Address
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Amul Dairy Road, Anand - 388001',
                            style: GoogleFonts.abel(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Rating and price
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Text(
                              ' 5   (500 Reviews)',
                              style: GoogleFonts.abel(
                                color: Colors.blueGrey,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              '₹999.99',
                              style: GoogleFonts.abel(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Divider
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),

                  // Features
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // WiFi
                      Column(
                        children: [
                          Icon(Icons.wifi, size: 25, color: Colors.blueGrey),
                          SizedBox(height: 5),
                          Text(
                            "Free WiFi",
                            style: GoogleFonts.merriweatherSans(
                              color: Colors.blueGrey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      // Photos
                      Column(
                        children: [
                          const Icon(Icons.add_a_photo_outlined,
                              size: 25, color: Colors.blueGrey),
                          SizedBox(height: 5),
                          Text(
                            "Photos",
                            style: GoogleFonts.merriweatherSans(
                              color: Colors.blueGrey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      // Bookmark
                      Column(
                        children: [
                          const Icon(Icons.bookmark_add_outlined,
                              size: 25, color: Colors.blueGrey),
                          SizedBox(height: 5),
                          Text(
                            "Bookmark",
                            style: GoogleFonts.merriweatherSans(
                              color: Colors.blueGrey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      // Share
                      Column(
                        children: [
                          const Icon(Icons.share_outlined,
                              size: 25, color: Colors.blueGrey),
                          Text(
                            "Share",
                            style: GoogleFonts.merriweatherSans(
                              color: Colors.blueGrey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Divider
                  Divider(),

                  // About
                  Row(
                    children: [
                      Text(
                        'About',
                        style: GoogleFonts.alata(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  // Description
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'The Big Farm Fresh Pizza Recipe got its name because of the fresh garden vegetables in it. Cheesy, spicy and crispy pizza which leaves you mouth-watering with a great Italian taste left behind. Perfect meal for lunch, tea time or dinner with Del Monte Tomato Ketchup and dried crushed oregano to sprinkle on top.Serve the Big Farm Fresh Pizza Recipe Loaded With Crisp Veggies with Baked Potato Wedges and Strawberry Mojitofor a complete weekend meal',
                          style: GoogleFonts.merriweatherSans(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Divider
                  SizedBox(height: 50),
                  Divider(),

                  // Gallery
                  Row(
                    children: [
                      Text(
                        'Gallery',
                        style: GoogleFonts.alata(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  // GridView for images
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns in the grid
                      crossAxisSpacing: 2, // Spacing between columns
                      mainAxisSpacing: 2, // Spacing between rows
                    ),
                    itemCount: 6, // Assuming item.additionalImages is a list of additional photo URLs
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.item.imageUrl, // Use index to access each additional photo URL
                        width: 100, // Width of each photo
                        height: 100, // Height of each photo
                        fit: BoxFit.cover,
                      );
                    },
                  ),

                  // Divider
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(),

                  // Location section
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: GoogleFonts.alata(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Display location using Google Maps or other method
                        Container(
                          height: 200, // Adjust height as needed
                          width: double.infinity, // Take full width
                          child: GoogleMap(
                            mapType: MapType.terrain,

                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                _currentPosition?.latitude ?? 0.0,
                                _currentPosition?.longitude ?? 0.0,
                              ),
                              zoom: 14,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId('current-location'),
                                position: LatLng(
                                  _currentPosition?.latitude ?? 0.0,
                                  _currentPosition?.longitude ?? 0.0,
                                ),
                                icon: BitmapDescriptor.defaultMarker,
                              ),
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Reviews
                  Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reviews',
                        style: GoogleFonts.alata(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // List of user reviews
                      Column(
                        children: List.generate(
                          5, // Number of user reviews
                              (index) {
                            // Generate dummy text for the review
                            String comment =
                                'This is review ${index + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus ligula id ex blandit, vel dapibus mauris aliquam. Sed id lorem orci.';
                            return ListTile(
                              leading: Icon(Icons.person,
                                  size: 30, color: Colors.blueGrey),
                              title: Row(
                                children: List.generate(
                                  5, // Total number of stars
                                      (starIndex) => Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 20,
                                  ),
                                ),
                              ),
                              subtitle: Text(comment),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  // Divider
                  SizedBox(height: 10),
                  Divider(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
