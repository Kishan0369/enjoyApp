import 'package:enjoy/view/Travel/travelDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utils/colors.dart';

class TarvelItem {
  final String name;
  final String imageUrl;

  TarvelItem({required this.name, required this.imageUrl});
}


class TarvelPoster {
  final String name;
  final String imageUrl;

  TarvelPoster({required this.name, required this.imageUrl});
}

class TravelScreen extends StatefulWidget {
  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  late List<TarvelItem> sportsItems;
  late List<TarvelPoster> sportsPosters;
  late List<TarvelItem> filteredSportsItems;
  late List<TarvelItem> trendingSportsItems;
  late List<TarvelItem> likedSportsItems;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sportsItems = [
      TarvelItem(name: 'Mountain ', imageUrl: 'assets/t1.png'),
      TarvelItem(name: 'Wildlife and Nature', imageUrl: 'assets/t5.png'),
      TarvelItem(name: 'Adventure', imageUrl: 'assets/t3.png'),
      TarvelItem(name: 'Beach', imageUrl: 'assets/t4.png'),
    ];
    sportsPosters = [
      TarvelPoster(name: 'Football Match', imageUrl: 'assets/tr1.jpg'),
      TarvelPoster(name: 'Basketball Game', imageUrl: 'assets/tr2.jpg'),
      TarvelPoster(name: 'Baseball Game', imageUrl: 'assets/tr3.jpg'),
      TarvelPoster(name: 'Tennis Tournament', imageUrl: 'assets/tr4.jpg'),
      TarvelPoster(name: 'Running Event', imageUrl: 'assets/tr3.jpg'),
    ];
    trendingSportsItems = [
      TarvelItem(name: 'Manali', imageUrl: 'assets/manali.jpg'),
      TarvelItem(name: 'Panchmarhi', imageUrl: 'assets/panchmarhi.jpg'),
      TarvelItem(name: 'Imagica', imageUrl: 'assets/imagica.jpg'),
    ];
    filteredSportsItems = sportsItems;
    likedSportsItems = [
      TarvelItem(name: 'Liked Item 1', imageUrl: 'assets/s3.jpg'),
      TarvelItem(name: 'Liked Item 2', imageUrl: 'assets/s4.jpg'),
    ];
  }

  void filterItems(String query) {
    setState(() {
      filteredSportsItems = sportsItems
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
                  'Travel',
                  style: GoogleFonts.josefinSans(
                    color:Color(0xFF191970),
                    fontWeight: FontWeight.w600,
                    fontSize: 50,
                  ),
                ),
                trailing: Container(
                  width: 50,
                  height: 50,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/c4.jpg',
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
                    hintText: 'Search Travel Places...',
                    prefixIcon: const Icon(
                      Icons.search,
                      color:  Color(0xFF191970),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear, color: Travel),
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
                        color: Color(0xFF191970),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Color(0xFF191970),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFF191970),
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xFF191970),
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
                items: sportsPosters.map((poster) {
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
                  'Browse Travel Categories',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF191970),
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
                  children: filteredSportsItems.map((item) {
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
                  'Trending Places',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF191970),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: trendingSportsItems.map((item) {
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
                  'Places You Like?',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF191970),
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                height: 350, // Adjust this height if necessary
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: likedSportsItems.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(likedSportsItems[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Recommended Places',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF191970),
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
                  itemCount: sportsItems.length,
                  itemBuilder: (context, index) {
                    return _buildGridItem(sportsItems[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(TarvelItem item) {
    return GestureDetector(
      onTap: (){
        Get.to(TravelDetailsScreen(item: item,));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Text(
              item.name,
              style: GoogleFonts.cabin(
                color: Color(0xFF191970),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildTrendingItemCard(TarvelItem item) {
    // Assuming TravelItem has a property for star rating called 'starRating'
    return GestureDetector(
      onTap: (){
        Get.to(TravelDetailsScreen(item: item,));
      },
      child: Card(
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          style: GoogleFonts.cabin(
                            color: Color(0xFF191970),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 15),
                        Icon(Icons.star, color: Colors.orange, size: 15),
                        Icon(Icons.star, color: Colors.orange, size: 15),
                        Icon(Icons.star, color: Colors.orange, size: 15),
                        Icon(Icons.star_border, color: Colors.orange, size: 15),
                        SizedBox(width: 10),
                      ],
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(TarvelItem item) {
    return GestureDetector(
      onTap: (){
        Get.to(TravelDetailsScreen(item: item,));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover, // Ensures the image covers the container
                  width: double.infinity, // Ensures the image takes full width of the container
                  height: 150, // Set a fixed height for the image container
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.name,
                style: GoogleFonts.cabin(
                  color: Color(0xFF191970),
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
}
