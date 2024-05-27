import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:io';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../api_connection/api_connection.dart';

class CameraForm extends StatefulWidget {
  @override
  _CameraFormState createState() => _CameraFormState();
}

class _CameraFormState extends State<CameraForm> {
  // Radio button value
  String radioValue = 'Foods';

  // Dropdown value and lists for each category
  String dropdownValue = 'Select';
  List<String> foodCategories = ['Select', 'Fast Food', 'Vegetarian', 'Desserts'];
  List<String> giftCategories = ['Select', 'Flowers', 'Toys', 'Electronics'];
  List<String> sportCategories = ['Select', 'Indoor', 'Outdoor', 'Gym'];
  List<String> travelCategories = ['Select', 'Beaches', 'Mountains', 'Cities'];

  List<String> currentCategories = ['Select'];

  // Rating value
  double ratingValue = 0;

  // Location value
  TextEditingController locationController = TextEditingController();
  TextEditingController commentsController = TextEditingController();

  // Selected file
  File? selectedFile;
  String? selectedFileName;

  GoogleMapController? _controller;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _pickImageFromCamera();
    _getCurrentLocation();
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          selectedFile = File(pickedFile.path);
          selectedFileName = pickedFile.name;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _removeFile() {
    setState(() {
      selectedFile = null;
      selectedFileName = null;
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }

    // Check for location permissions.
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied.');
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('Current Position: ${position.latitude}, ${position.longitude}');

    // Set initial camera position
    CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 15,
    );
    _controller?.animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition));

    // Get the address from the coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      String address = '${place.street}, ${place.locality}, ${place.country}';
      setState(() {
        locationController.text = address;
        _setMarker(position.latitude, position.longitude);
      });
      print('Address: $address');
    }
  }

  void _updateDropdownItems(String category) {
    switch (category) {
      case 'Foods':
        currentCategories = foodCategories;
        dropdownValue = 'Select';
        break;
      case 'Gifts':
        currentCategories = giftCategories;
        dropdownValue = 'Select';
        break;
      case 'Sports':
        currentCategories = sportCategories;
        dropdownValue = 'Select';
        break;
      case 'Travel':
        currentCategories = travelCategories;
        dropdownValue = 'Select';
        break;
    }
  }
  void _setMarker(double lat, double lng) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId('Current Location'),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: 'Current Location'),
        ),
      );
    });
  }

  void _uploadDataToServer() async {
    if (selectedFile == null) {
      Fluttertoast.showToast(
        msg: "Please select an image",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    try {
      var imageUrl = await _uploadImageToStorage(); // Upload image to storage and get URL
      if (imageUrl != null) {
        var response = await http.post(
          Uri.parse(API.uploadNewItem),
          body: {
            'category': radioValue,
            'subcategory': dropdownValue,
            'rating': ratingValue.toString(),
            'comments': commentsController.text,
            'location': locationController.text,
            'image': imageUrl, // Store image URL in the database
          },
        );
        print(response.body);
        if (response.statusCode == 200) {
          print('Data uploaded successfully');
          Fluttertoast.showToast(
            msg: "Data uploaded successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
        } else {
          print('Failed to upload data. Status code: ${response.statusCode}');
          Fluttertoast.showToast(
            msg: "Failed to upload data. Status code: ${response.statusCode}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      } else {
        print('Failed to upload image');
      }
    } catch (e) {
      print('Error uploading data: $e');
      Fluttertoast.showToast(
        msg: "Error uploading data: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  Future<String?> _uploadImageToStorage() async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(API.uploadNewItem));
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        selectedFile!.path,
        filename: selectedFileName,
      ));
      var response = await request.send();
      if (response.statusCode == 200) {
        // Read response stream and convert it to a string
        String imageUrl = await response.stream.bytesToString();
        return imageUrl;
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [Colors.yellowAccent, Colors.red, Colors.blue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ).createShader(bounds);
                },
                child: Text(
                  'Enjoy',
                  style: GoogleFonts.dancingScript(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 70,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Food | Gift | Travel | Sports',
                style: GoogleFonts.aboreto(
                  color: Colors.black54,
                  fontWeight: FontWeight.w900,
                  fontSize: 10,
                  letterSpacing: 2,
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Add Photos',
                          style: GoogleFonts.aboreto(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: _pickImageFromCamera,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                if (selectedFile != null)
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.file(
                                          selectedFile!,
                                          width: double.infinity,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 5,
                                        right: 5,
                                        child: IconButton(
                                          icon: Icon(Icons.cancel_outlined, color: Colors.red),
                                          onPressed: _removeFile,
                                        ),
                                      ),
                                    ],
                                  ),
                                if (selectedFileName != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      selectedFileName!,
                                      style: GoogleFonts.roboto(fontSize: 16),
                                    ),
                                  ),
                                if (selectedFile == null)
                                  Column(
                                    children: [
                                      Text(
                                        'Upload Image',
                                        style: GoogleFonts.roboto(fontSize: 16),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.add, size: 40, color: Colors.purple[300]),
                                        onPressed: _pickImageFromCamera,
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Divider(),
                      SizedBox(height: 16.0),


                      Text('Category', style: GoogleFonts.cousine(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple)),
                      SizedBox(height: 16.0),
                      Row(

                        children: ['Foods', 'Gifts', 'Sports', 'Travel'].map((String category) {
                          return Expanded(
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: category,
                                  groupValue: radioValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      radioValue = value!;
                                      _updateDropdownItems(value);
                                    });
                                  },
                                ),
                                Flexible(
                                  child: Text(
                                    category,
                                    style: GoogleFonts.ruda(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 16.0),
                      Divider(),
                      SizedBox(height: 16.0),


                      Text('Select Sub Category', style: GoogleFonts.ruda(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple)),
                      SizedBox(height: 16.0),
                      InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            isExpanded: true,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: currentCategories.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: GoogleFonts.ruda(fontSize: 16)),
                              );
                            }).toList(),
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Divider(),
                      SizedBox(height: 16.0),

                      Text('Rating', style: GoogleFonts.ruda(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple)),
                      SizedBox(height: 16.0),
                      RatingBar.builder(
                        initialRating: ratingValue,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            ratingValue = rating;
                          });
                        },
                        itemSize: 30,
                      ),
                      SizedBox(height: 30.0),
                      Divider(),
                      SizedBox(height: 16.0),

                      Text('Comments', style: GoogleFonts.ruda(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple)),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: commentsController,
                        maxLines: 5,
                        minLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      SizedBox(height: 16.0),
                      Divider(),
                      SizedBox(height: 16.0),


                      Text('Location', style: GoogleFonts.ruda(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple)),
                      SizedBox(height: 16.0),
                      Card(
                        elevation: 2,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          // Border color
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 200, // Adjust height as needed
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(0, 0), // Initial position will be overridden with current location
                                zoom: 50,
                              ),
                              mapType: MapType.normal,
                              markers: _markers,
                              onMapCreated: (GoogleMapController controller) {
                                _controller = controller;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),

                      TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        enabled: false, // Disable the TextField
                      ),
                      SizedBox(height: 16.0),


                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                           _uploadDataToServer();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.ruda(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
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
