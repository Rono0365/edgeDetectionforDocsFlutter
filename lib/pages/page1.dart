
import "dart:io";

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:ionicons/ionicons.dart";
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:path_provider/path_provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  
  double getHeightMultiplier(double absoluteHeight) {
  // Reference design height (iPhone 13)
  const double referenceScreenHeight = 812.0;
  
  // Calculate the multiplier by dividing the absolute height by reference height
  double multiplier = absoluteHeight / referenceScreenHeight;
  
  // Round to 4 decimal places for cleaner values
  return double.parse(multiplier.toStringAsFixed(4));
}
DocumentScanningResult? _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             SizedBox(height: MediaQuery.of(context).size.height*getHeightMultiplier(10)),
            Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 180,
                                      width:
                                          MediaQuery.of(context).size.width ,
                                      decoration: BoxDecoration(
                                         image: const DecorationImage(
                                      image: AssetImage("assets/laptop.png",), // Replace with your image path
                                      fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
                                    ),
                                          /*
                                        Colors.lightBlue,
                                      Colors.green,
                                      Colors.deepOrange,
                                      Colors.red,
                                      Colors.orange,
                                        */
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                
                                
                                    Container(
                                      height: 180,
                                      width:
                                          MediaQuery.of(context).size.width ,
                                      decoration: BoxDecoration(
                                       gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                       Colors.blue.withOpacity(0.9),
                                       Colors.blue.withOpacity(0.6),
                                       Colors.blue.withOpacity(0.4),
                                       Colors.blue.withOpacity(0.3),
                                      Colors.blue.withOpacity(0.2),
                                      ],
                                    ),
                                          /*
                                        Colors.lightBlue,
                                      Colors.green,
                                      Colors.deepOrange,
                                      Colors.red,
                                      Colors.orange,
                                        */
                                        //  color: Colors.lightBlue.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ListTile(
                                              title: Text(
                                              " ",//"${widget.cattendance.where((p) => p["name"].toString().replaceAll(",", "") == widget.username).toSet().toList().length}", //chnge
                                              style: GoogleFonts.montserrat(
                                                fontSize: 22,
                                                color: Colors.black,
                                              ),
                                            ),
                                                ),
                                          
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      right:10,
                                      top: 10,
                                      child:Center(
                                        child: Text("Your Digital Document Assistant",
                                        textAlign: TextAlign.center,
                                                 style: GoogleFonts.montserrat(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    color:  Colors.white,
                                                  ),),
                                      ),)
                                  ],
                                ),
                              ),
            SizedBox(height: 10,),
              ListTile(
            
        
            title: Text("Your documents",style: GoogleFonts.dmSans(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w500,
                                                      color:  Colors.blueGrey.shade900,
                                                    ),),),
        
                                                     SizedBox(
                                                      height:  200,//MediaQuery.of(context).size.height* getHeightMultiplier(750),
                                                       child: ImageGalleryPage(),
                                                       
                                                      /* Wrap(
                                                        alignment: WrapAlignment.center,
                                                        runSpacing: 10.0,
                                                        spacing: 5.0,
                                                        //physics: NeverScrollableScrollPhysics(),
                                                        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                                                         // shrinkWrap: true,

                                                        
                                                                //   crossAxisCount: 2,
                                                                  // childAspectRatio: 1.2,
                                                                   //crossAxisSpacing: 16,
                                                                   //mainAxisSpacing: 16,
                                                                   children: [
                                                                                           ...["Form 4\nelectromagnetism","Form 3\nBiology Human","Form 2\nMaths Trigonometry","Form 4\nelectricity"].map((i)=>                
                                                                                        Padding(
                                                                                          padding: const EdgeInsets.all(3.0),
                                                                                          child: CourseCard(
                                                                                            courseName: "$i",
                                                                                            onViewDetails: () {
                                                                                              // Handle view course action
                                                                                            },
                                                                                          ),
                                                                                        )   )
                                                            ],),*/
                                                     ),
                                                        
                                                      
                                                    
            
            const ListTile(),
            const ListTile()
            ]
            
            ,
        ),
      ),
    );
  }
}
class CourseCard extends StatelessWidget {
  final String courseName;
  final VoidCallback onViewDetails;

  const CourseCard({
    Key? key,
    required this.courseName,
    required this.onViewDetails,
  }) : super(key: key);

  void _showDetails(BuildContext context) {
    /*showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.black,
      context: context,
      builder: (context) =>  details(name: courseName)
    );*/
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return InkWell(
     // onTap: () => _showDetails(context),
      child: SizedBox(
        //height: height * 0.35,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Course Image
            Container(
              width: 190,
              height: 200, // 150/812 ≈ 0.185
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
      color: Colors.blue,
      width: 2.0, // Adjust the width as needed
    ),
      
                
              ),
            ),
            
            // Course Title
        
            
            // View Course Button
            
          ],
        ),
      ),
    );
  }
}

// Usage example:
class CourseGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return CourseCard(
          courseName: "Doc Name",
          onViewDetails: () {
            // Handle view course action
          },
        );
      },
    );
  }
}
class ImageRetriever {
  Future<List<File>> retrieveImagesFromPath() async {
    try {
      // The specific path you provided
      final directory = Directory('/data/user/0/com.example.edge3/app_flutter/');
      
      // Check if directory exists
      if (!await directory.exists()) {
        print('Directory does not exist');
        return [];
      }

      // List all files in the directory
      List<FileSystemEntity> files = directory.listSync();

      // Filter for image files (common image extensions)
      List<File> imageFiles = files
          .where((file) => 
              file.path.toLowerCase().endsWith('.jpg') ||
              file.path.toLowerCase().endsWith('.jpeg') ||
              file.path.toLowerCase().endsWith('.png') ||
              file.path.toLowerCase().endsWith('.gif') ||
              file.path.toLowerCase().endsWith('.webp'))
          .map((file) => File(file.path))
          .toList();

      // Print out the found image paths for verification
      imageFiles.forEach((image) {
        print('Found image: ${image.path}');
      });

      return imageFiles;
    } catch (e) {
      print('Error retrieving images: $e');
      return [];
    }
  }

  // Method to display images in a Flutter widget
  Widget displayImagesFromPath() {
    return FutureBuilder<List<File>>(
      future: retrieveImagesFromPath(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return  ListTile(
            
            title:    Center(child:Text('No images found')));
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return Image.file(
              snapshot.data![index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return Icon(Icons.error);
              },
            );
          },
        );
      },
    );
  }
}

// Usage example in a StatelessWidget
class ImageGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ImageRetriever().displayImagesFromPath()
    ;
  }
}