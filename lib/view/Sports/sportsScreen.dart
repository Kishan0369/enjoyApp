import 'package:enjoy/view/Sports/sportDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrendingSportsItem {
  final String name;
  final String imageUrl;

  TrendingSportsItem({required this.name, required this.imageUrl});
}

class SportsItem {
  final String name;
  final String imageUrl;

  SportsItem({required this.name, required this.imageUrl});
}

class SportsPoster {
  final String name;
  final String imageUrl;

  SportsPoster({required this.name, required this.imageUrl});
}

class SportsScreen extends StatefulWidget {
  @override
  _SportsScreenState createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  late List<SportsItem> sportsItems;
  late List<SportsPoster> sportsPosters;
  late List<SportsItem> filteredSportsItems;
  late List<TrendingSportsItem> trendingSportsItems;
  late List<SportsItem> likedSportsItems;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    sportsItems = [
      SportsItem(name: 'Football', imageUrl: 'assets/football.png'),
      SportsItem(name: 'Basketball', imageUrl: 'assets/basket1.png'),
      SportsItem(name: 'Cricket', imageUrl: 'assets/cricket.png'),
      SportsItem(name: 'Tennis', imageUrl: 'assets/tennis1.png'),
    ];
    sportsPosters = [
      SportsPoster(name: 'Football Match', imageUrl: 'assets/s1.jpg'),
      SportsPoster(name: 'Basketball Game', imageUrl: 'assets/s2.jpg'),
      SportsPoster(name: 'Baseball Game', imageUrl: 'assets/s3.jpg'),
      SportsPoster(name: 'Tennis Tournament', imageUrl: 'assets/s4.jpg'),
      SportsPoster(name: 'Running Event', imageUrl: 'assets/s3.jpg'),
    ];
    trendingSportsItems = [
      TrendingSportsItem(name: 'Soccer Game', imageUrl: 'assets/soccer.jpg'),
      TrendingSportsItem(name: 'Basketball Game', imageUrl: 'assets/basket01.jpg'),
      TrendingSportsItem(name: 'Tennis Game', imageUrl: 'assets/tennis01.jpg'),
    ];
    filteredSportsItems = sportsItems;
    likedSportsItems = [
      SportsItem(name: 'Liked Item 1', imageUrl: 'assets/s3.jpg'),
      SportsItem(name: 'Liked Item 2', imageUrl: 'assets/s4.jpg'),
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
                  'Sports',
                  style: GoogleFonts.josefinSans(
                    color: Color(0xFF4E342E),
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
                    hintText: 'Search Sports items...',
                    prefixIcon: Icon(
                      Icons.search,
                      color:  Color(0xFF4E342E),
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                      icon: Icon(Icons.clear, color: Color(0xFF4E342E)),
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
                        color: Color(0xFF4E342E),
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: Color(0xFF4E342E),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFF4E342E),
                    ),
                    hintStyle: TextStyle(
                      color: Color(0xFF4E342E),
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
                  'Browse Sports Categories',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF4E342E),
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
                  'Trending Sports Games',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF4E342E),
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
                  'Games You Like?',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF4E342E),
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
                  'Recommended Games',
                  style: GoogleFonts.cabin(
                    color: Color(0xFF4E342E),
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

  Widget _buildCategoryCard(SportsItem item) {
    return GestureDetector(
      onTap: (){
        Get.to(SportsDetailsScreen(item: item,));
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
                color: Color(0xFF4E342E),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingItemCard(TrendingSportsItem item) {
    return Card(
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
              child: Text(
                item.name,
                style: GoogleFonts.cabin(
                  color: Color(0xFF4E342E),
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

  Widget _buildGridItem(SportsItem item) {
    return GestureDetector(
      onTap: (){
        Get.to(SportsDetailsScreen(item: item,));

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
                  color: Color(0xFF4E342E),
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
