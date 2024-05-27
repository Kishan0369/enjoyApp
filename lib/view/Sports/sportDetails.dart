import 'package:enjoy/view/Gift/giftScreen.dart';
import 'package:enjoy/view/Sports/sport_review_photo.dart';
import 'package:enjoy/view/Sports/sportsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';



class SportsDetailsScreen extends StatelessWidget {
  final SportsItem item;

  SportsDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF4E342E),

        title: Text('Sports Location',style: GoogleFonts.josefinSans(
          color: Colors.white, // This color will be overridden by the gradient
          fontWeight: FontWeight.w500,
          fontSize: 25,
          letterSpacing: 2,

        ),),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Card(

                color: Colors.white,
                child: SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16), // Adjust padding
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Set border radius for image
                      child: SizedBox(
                        width: 80, // Set a fixed width if needed
                        height: 200, // Set the desired height for the image
                        child: Image.asset(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(
                              '₹999.99',
                              style: TextStyle(fontSize: 16.0,color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 15),
                            Icon(Icons.star, color: Colors.orange, size: 15),
                            Icon(Icons.star, color: Colors.orange, size: 15),
                            Icon(Icons.star, color: Colors.orange, size: 15),
                            Icon(Icons.star, color: Colors.orange, size: 15),
                            SizedBox(width: 10),
                          ],
                        ),
                        SizedBox(height: 9.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.storefront,color: Colors.red,size: 20),
                            SizedBox(width: 5,),
                            Text(
                              'Amul Foodland',
                              style: TextStyle(fontSize: 16.0,color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.call,size: 15,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text(
                              '8980888833',
                              style: TextStyle(fontSize: 15.0,color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: const Column(
                      children: [
                        Icon(Icons.location_on,color: Colors.red),
                        SizedBox(height: 6,),
                        Text('Anand,Gujrat',style: TextStyle(color: Colors.orange),)
                      ],
                    ),
                    onTap: () {
                      Get.to(() => SportInfo(item: item)); // Navigate to ItemDetailsScreen
                    },

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Card(

                color: Colors.white,
                child: SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16), // Adjust padding
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Set border radius for image
                      child: Image.asset(
                        item.imageUrl,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(
                              '₹999.99',
                              style: TextStyle(fontSize: 16.0,color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),
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
                        SizedBox(height: 9.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.storefront,color: Colors.red,size: 20),
                            SizedBox(width: 5,),
                            Text(
                              'Lapinoz Pizza',
                              style: TextStyle(fontSize: 16.0,color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.call,size: 15,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text(
                              '8980888833',
                              style: TextStyle(fontSize: 15.0,color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Icon(Icons.location_on,color: Colors.red),
                        SizedBox(height: 6,),
                        Text('Anand,Gujrat',style: TextStyle(color: Colors.orange),)
                      ],
                    ),
                    onTap: () {
                      Get.to(() => SportInfo(item: item)); // Navigate to ItemDetailsScreen
                    },

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Card(

                color: Colors.white,
                child: SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16), // Adjust padding
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Set border radius for image
                      child: Image.asset(
                        item.imageUrl,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(
                              '₹999.99',
                              style: TextStyle(fontSize: 16.0,color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),
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
                        SizedBox(height: 9.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.storefront,color: Colors.red,size: 20),
                            SizedBox(width: 5,),
                            Text(
                              'Pizzawala',
                              style: TextStyle(fontSize: 16.0,color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.call,size: 15,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text(
                              '8980888833',
                              style: TextStyle(fontSize: 15.0,color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Icon(Icons.location_on,color: Colors.red),
                        SizedBox(height: 6,),
                        Text('Anand,Gujrat',style: TextStyle(color: Colors.orange),)
                      ],
                    ),
                    onTap: () {
                      Get.to(() => SportInfo(item: item)); // Navigate to ItemDetailsScreen
                    },

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Card(

                color: Colors.white,
                child: SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16), // Adjust padding
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Set border radius for image
                      child: Image.asset(
                        item.imageUrl,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(
                              '₹999.99',
                              style: TextStyle(fontSize: 16.0,color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),
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
                        SizedBox(height: 9.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.storefront,color: Colors.red,size: 20),
                            SizedBox(width: 5,),
                            Text(
                              'Taza Maza Pizza',
                              style: TextStyle(fontSize: 16.0,color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.call,size: 15,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text(
                              '8980888833',
                              style: TextStyle(fontSize: 15.0,color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Icon(Icons.location_on,color: Colors.red),
                        SizedBox(height: 6,),
                        Text('Anand,Gujrat',style: TextStyle(color: Colors.orange),)
                      ],
                    ),
                    onTap: () {
                      Get.to(() => SportInfo(item: item)); // Navigate to ItemDetailsScreen
                    },

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Card(

                color: Colors.white,
                child: SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16), // Adjust padding
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Set border radius for image
                      child: Image.asset(
                        item.imageUrl,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(
                              '₹999.99',
                              style: TextStyle(fontSize: 16.0,color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),
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
                        SizedBox(height: 9.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.storefront,color: Colors.red,size: 20),
                            SizedBox(width: 5,),
                            Text(
                              'Dominoz Pizza',
                              style: TextStyle(fontSize: 16.0,color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.call,size: 15,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text(
                              '8980888833',
                              style: TextStyle(fontSize: 15.0,color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Icon(Icons.location_on,color: Colors.red),
                        SizedBox(height: 6,),
                        Text('Anand,Gujrat',style: TextStyle(color: Colors.orange),)
                      ],
                    ),
                    onTap: () {
                      Get.to(() => SportInfo(item: item)); // Navigate to ItemDetailsScreen
                    },

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: Card(

                color: Colors.white,
                child: SizedBox(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16), // Adjust padding
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Set border radius for image
                      child: Image.asset(
                        item.imageUrl,
                        width: 80,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.name,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text(
                              '₹999.99',
                              style: TextStyle(fontSize: 16.0,color: Colors.blueGrey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),
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
                        SizedBox(height: 9.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.storefront,color: Colors.red,size: 20),
                            SizedBox(width: 5,),
                            Text(
                              'Rockstar Pizza',
                              style: TextStyle(fontSize: 16.0,color: Colors.red,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        SizedBox(height: 9.0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.call,size: 15,color: Colors.blue,),
                            SizedBox(width: 5,),
                            Text(
                              '8980888833',
                              style: TextStyle(fontSize: 15.0,color: Colors.blue,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Icon(Icons.location_on,color: Colors.red),
                        SizedBox(height: 6,),
                        Text('Anand,Gujrat',style: TextStyle(color: Colors.orange),)
                      ],
                    ),
                    onTap: () {
                      Get.to(() => SportInfo(item: item)); // Navigate to ItemDetailsScreen
                    },

                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
