import 'package:enjoy/view/Gift/giftScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/item_card.dart';
import '../items_review_photos.dart';
import 'giftDetails.dart';

class TrendingItems {
  final String name;
  final String imageUrl;

  TrendingItems({required this.name, required this.imageUrl});
}

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

class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  late List<Item> items;
  late List<Poster> posters;
  late List<Item> filteredItems;
  late List<TrendingItems> trendingItems;
  late List<Item> likedItems; // Add this list for liked items

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    items = [
      Item(name: 'Home Decor', imageUrl: 'assets/g1.png'),
      Item(name: 'Fashion', imageUrl: 'assets/g2.png'),
      Item(name: 'Games', imageUrl: 'assets/g3.png'),
      Item(name: 'Foods & Drinks', imageUrl: 'assets/g4.png'),
    ];
    posters = [
      Poster(name: 'Farm Fresh Pizza', imageUrl: 'assets/c1.jpeg'),
      Poster(name: 'Paneer Bhurji', imageUrl: 'assets/c2.jpeg'),
      Poster(name: 'Gujrati Dish', imageUrl: 'assets/c3.jpeg'),
      Poster(name: 'Nexus Cheez Burst Pizza', imageUrl: 'assets/c4.jpg'),
      Poster(name: 'Nexus Cheez Burst Pizza', imageUrl: 'assets/c2.jpeg'),
    ];
    trendingItems = [
      TrendingItems(name: 'Toys', imageUrl: 'assets/toys.jpg'),
      TrendingItems(name: 'Clothes', imageUrl: 'assets/clothes.jpg'),
      TrendingItems(name: 'Uno Game', imageUrl: 'assets/games.jpg'),
    ];
    filteredItems = items;
    likedItems = [
      Item(name: 'Liked Item 1', imageUrl: 'assets/toys.jpg'),
      Item(name: 'Liked Item 2', imageUrl: 'assets/clothes.jpg'),
      // Add more liked items here
    ];
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
                  'Gifts',
                  style: GoogleFonts.josefinSans(
                    color: Color(0xFF3B5998),
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _searchController,
                  onChanged: filterItems,
                  decoration: InputDecoration(
                    hintText: 'Search Gift items...',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF3B5998),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear, color: Colors.blue[200]),
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
                        color: Color(0xFF3B5998),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Color(0xFF3B5998),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFF3B5998),
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xFF3B5998),
                    ),
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
                items: posters.map((poster) {
                  return Card(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          poster.imageUrl,
                          fit: BoxFit.cover,
                          width: 500,
                          height: 200,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Browse Gift Categories',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF3B5998),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: filteredItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: _buildCategoryCard(item),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Trending Gift Items',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF3B5998),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: trendingItems.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: _buildTrendingItemCard(item),
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
                    color: Color(0xFF3B5998),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                height: 400, // Adjust this height if necessary
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: likedItems.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(likedItems[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recommended Items',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF3B5998),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                height: 1000, // Adjust this height if necessary
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(items[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Item item) {
    return GestureDetector(
      onTap: (){
        Get.to(GifftDetailsScreen(item: item));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.0), bottom: Radius.circular(10)),
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.fitHeight,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: GoogleFonts.josefinSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingItemCard(TrendingItems item) {
    return GestureDetector(
      onTap: () {

      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 100,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10.0), bottom: Radius.circular(10)),
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: GoogleFonts.josefinSans(
                  color: Colors.black,
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
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(Item item) {
    return GestureDetector(
      onTap: (){
        Get.to(GifftDetailsScreen(item: item));

      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.fitWidth,
                    height: 150,
                    width: 100,

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: GoogleFonts.josefinSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 15),
                  Icon(Icons.star, color: Colors.orange, size: 15),
                  Icon(Icons.star, color: Colors.orange, size: 15),
                  Icon(Icons.star_border, color: Colors.orange, size: 15),
                  Icon(Icons.star_border, color: Colors.orange, size: 15),
                  SizedBox(width: 10),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
