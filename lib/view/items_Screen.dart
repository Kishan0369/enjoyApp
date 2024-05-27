import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../widgets/item_card.dart';
import 'items_Details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'items_review_photos.dart';

class Item {
  final String name;
  final String imageUrl;

  Item({required this.name, required this.imageUrl});
}

class Poster {
  final String name;
  final String imageUrl;

  Poster({required this.name, required this.imageUrl});
}

class ItemsScreen extends StatefulWidget {
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late List<Item> items;
  late List<Poster> poster;
  late List<Item> filteredItems;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    items = [
      Item(name: 'Pizza', imageUrl: 'assets/pizza.jpeg'),
      Item(name: 'Punjabi', imageUrl: 'assets/punjabi.jpeg'),
      Item(name: 'Gujrati Dish', imageUrl: 'assets/fd1.jpeg'),
      Item(name: 'Nexus Cheez Burst Pizza', imageUrl: 'assets/fd2.jpeg'),
      Item(name: 'Shahi Paneer', imageUrl: 'assets/fd3.jpeg'),
      Item(name: 'Vagharelo Rotlo', imageUrl: 'assets/gujrati.jpg'),
      Item(name: 'Mix Sabji', imageUrl: 'assets/gujrati.jpg'),
      Item(name: 'Pizza', imageUrl: 'assets/pizza.jpg'),
      Item(name: 'Dal Makhni', imageUrl: 'assets/punjabi.jpg'),
      Item(name: 'Kaju Gathiya', imageUrl: 'assets/gujrati.jpg'),
      Item(name: 'Margreeta Pizza', imageUrl: 'assets/pizza.jpg'),
      Item(name: 'Paneer Handi', imageUrl: 'assets/punjabi.jpg'),
      Item(name: 'Sev Tameta', imageUrl: 'assets/gujrati.jpg'),
      Item(name: 'Puff Pizza', imageUrl: 'assets/pizza.jpg'),
      Item(name: 'Paneer Toofani', imageUrl: 'assets/punjabi.jpg'),
      // Add more items as needed
    ];
    poster = [
      Poster(name: 'Farm Fresh Pizza', imageUrl: 'assets/food2.jpg'),
      Poster(name: 'Paneer Bhurji', imageUrl: 'assets/p2.jpeg'),
      Poster(name: 'Gujrati Dish', imageUrl: 'assets/f10.jpeg'),
      Poster(name: 'Nexus Cheez Burst Pizza', imageUrl: 'assets/f9.jpeg'),
      Poster(name: 'Nexus Cheez Burst Pizza', imageUrl: 'assets/p7.jpeg'),

    ];


    filteredItems = items;
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.yellowAccent, Colors.red,Colors.blue], // Define your gradient colors
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Enjoy',
                    style: GoogleFonts.dancingScript(
                      color: Colors.white, // This color will be overridden by the gradient
                      fontWeight: FontWeight.w900,
                      fontSize: 70,
                      letterSpacing: 5,
                    ),
                  ),
                )

              ),
              SizedBox(height: 10),

              Center(
                child: Text(
                  'Food | Gift | Travel | Sports',
                  style: GoogleFonts.aboreto(
                    color: Colors.black54, // This color will be overridden by the gradient
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 40),

              ListTile(
                title: Text(
                  'Foods',
                  style: GoogleFonts.josefinSans(
                    color: Color(0xFFE53935),
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                  ),
                ),
                trailing: Container(
                  width: 50,
                  height: 50,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/gujrati.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () {},
              ),
              SizedBox(height: 40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _searchController,
                  onChanged: filterItems,
                  decoration: InputDecoration(
                    hintText: 'Search Food items...',
                    prefixIcon: Icon(Icons.search, color: Color(0xFFE53935)),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear,
                          color: Color(0xFFE53935)),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          filterItems('');
                        });
                      },
                    )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                          color: Color(0xFFE53935),
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color:  Color(0xFFE53935)),
                    ),
                    labelStyle: TextStyle(color: Color(0xFFE53935)),
                    hintStyle: TextStyle(color: Color(0xFFE53935)),
                  ),
                ),
              ),
              SizedBox(height: 10),

              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
                items: poster.map((poster) {
                  return Card(
                    child: Center(

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(poster.imageUrl, fit: BoxFit.cover, width: 500,height: 200,),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Browse Categories',
                  style:  GoogleFonts.cabin(
                    color: Color(0xFFE53935),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,

                  ),
                ),
              ),
              SizedBox(height: 10),
              // Adjusted SizedBox height
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // Added horizontal padding to the list view
                  children: filteredItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      // Adjust spacing between items as needed
                      child: _buildCategoryCard(item),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Trending Items',
                  style: GoogleFonts.cabin(
                    color: Color(0xFFE53935),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,

                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // Added horizontal padding to the list view
                  children: filteredItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      // Adjust spacing between items as needed
                      child: _buildItemCard(item),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 60),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Items You Like?',
                  style: GoogleFonts.cabin(
                    color: Color(0xFFE53935),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,

                  ),
                ),
              ),
              Container(
                  height: 20000,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: items.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.0), // Adjust spacing between items
                        child: ItemCard(item: items[index]),
                      );
                    },
                  ),
                )

              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Item item) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0), // Adjust padding as needed
              child:Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.0),bottom: Radius.circular(10)),
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover
                    // Ensure the height matches the container's height
                  ),
                ),
              )

            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(4.0),
          //   child: Text(
          //     item.name,
          //     style: GoogleFonts.alike(
          //       color: Colors.black54,
          //       fontWeight: FontWeight.w700,
          //       fontSize: 18,
          //
          //       // shadows: [
          //       //   Shadow(
          //       //     offset: Offset(-1.5, -1.5),
          //       //     color: Colors.white,
          //       //   ),
          //       //   Shadow(
          //       //     offset: Offset(-1.5, -1.5),
          //       //     color: Colors.white,
          //       //   ),
          //       //   Shadow(
          //       //     offset: Offset(-1.5, 1.5),
          //       //     color: Colors.white,
          //       //   ),
          //       //   Shadow(
          //       //     offset: Offset(-1.5, 1.5),
          //       //     color: Colors.white,
          //       //   ),
          //       // ],
          //     ),
          //     textAlign: TextAlign.start,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildItemCard(Item item) {
    return GestureDetector(
      onTap: (){
        Get.to(() => ItemDetailsScreen(item: item));
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0), // Adjust padding as needed
                child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      height: 200,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0), bottom: Radius.circular(10)),
                        child: Image.asset(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0), // Adjust padding as needed
              child: Text(
                item.name, // Display the item name here
                style: GoogleFonts.josefinSans(
                  color: Color(0xFFE53935),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,

                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 15),
                Icon(Icons.star, color: Colors.orange, size: 15),
                Icon(Icons.star, color: Colors.orange, size: 15),
                Icon(Icons.star_border, color: Colors.orange, size: 15),
                Icon(Icons.star_border, color: Colors.orange, size: 15),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 30,),


          ],
        ),
      ),
    );
  }




}
