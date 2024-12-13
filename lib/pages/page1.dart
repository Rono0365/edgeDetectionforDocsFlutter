
import "dart:io";

import "package:edge3/pages/page2.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:ionicons/ionicons.dart";
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

int _selectedIndex =0;
bool adbx =true;
bool all=true;
  bool unread=false;
  bool groups=false;
Widget _buildContainer(String text, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(30), // Border radius of 30
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
            width: 2,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: adbx?SizedBox():  Container(
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:Color(0xFF004AAD) ,
                                  child: Icon(
                                    Ionicons.add,
                                    color:Colors.white,
                                    opticalSize: 30,
                                        //: Colors.black,
                                  ),
                                ),
                              ),
      bottomNavigationBar: SizedBox(height:60),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      hintStyle:  GoogleFonts.dmSans(
                   // fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade700,
                  ),
                      hintText: 'Search here',
                      prefixIcon: Icon(Ionicons.search_outline),
                      fillColor: Colors.grey.shade200.withOpacity(0.6),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),                                       
                  Row(
                    children: [
                      SizedBox(width: 10,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.6,
                        child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                                                        onTap: (){
                                                                            setState(() {
                                                                            all = all?false: true;
                                                                            groups =false;
                                                                            unread =false;
                                                                         
                                                                          });
                                                                        },
                                                                        child: Padding(
                                          
                                                                          padding:
                                                                              const EdgeInsets
                                                                                  .only(
                                                                                  top:3.0,bottom: 3.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius
                                                                                    .circular(
                                                                                        10),
                                                                            child:
                                                                                Container(
                                                                              height: 40,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                color: all? Color.fromRGBO(33, 150, 243, 1)
                                                                                    .withOpacity(
                                                                                        0.3):Colors.grey.shade200.withOpacity(0.6),
                                                                                borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        20),
                                                                              ),
                                                                              child:
                                                                                  Padding(
                                                                                padding: const EdgeInsets
                                                                                    .all(
                                                                                    4.0),
                                                                                child:
                                                                                    Row(
                                                                                  mainAxisSize:
                                                                                      MainAxisSize.min,
                                                                                  children: [
                                                                                    const SizedBox(
                                                                                      width:
                                                                                          15,
                                                                                    ),
                                                                                    Text(
                                                                                      "All",
                                                                                      style:  GoogleFonts.dmSans(
                                                   // fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color:all? Colors.blue.shade700:Colors.grey.shade700,
                                                  ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width:
                                                                                          15,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                ),


                                                                      InkWell(
                                                                        onTap: (){
                                                                          setState(() {
                                                                            groups = groups?false: true;
                                                                            all = false;
                                                                            unread=false;
                                                                         
                                                                          });
                                                                        },
                                                                        child: Padding(
                                                                                                                
                                                                          padding:
                                                                              const EdgeInsets
                                                                                  .only(
                                                                                  top:3.0,bottom: 3.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius
                                                                                    .circular(
                                                                                        10),
                                                                            child:
                                                                                Container(
                                                                              height: 40,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                color: 
                                                  groups? Color.fromRGBO(33, 150, 243, 1)
                                                                                    .withOpacity(
                                                                                        0.3):Colors.grey.shade200.withOpacity(0.6),
                                                                                borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        20),
                                                                              ),
                                                                              child:
                                                                                  Padding(
                                                                                padding: const EdgeInsets
                                                                                    .all(
                                                                                    4.0),
                                                                                child:
                                                                                    Row(
                                                                                  mainAxisSize:
                                                                                      MainAxisSize.min,
                                                                                  children: [
                                                                                    const SizedBox(
                                                                                      width:
                                                                                          10,
                                                                                    ),
                                                                                    Text(
                                                                                      "Groups",
                                                                                      style:          GoogleFonts.dmSans(
                                                                                         // fontSize: 12,
                                                                                          fontWeight: FontWeight.w400,
                                                                                          color:groups? Colors.blue.shade700:Colors.grey.shade700,
                                                                                        ),),
                                                                                    const SizedBox(
                                                                                      width:
                                                                                          10,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      InkWell(
                                                                        onTap: (){
                                                                          setState(() {
                                                                            unread =unread?false: true;
                                                                            all=false;
                                                                            groups=false;
                                                                          });
                                                                        },
                                                                        child: Padding(
                                                                                                                
                                                                          padding:
                                                                              const EdgeInsets
                                                                                  .only(
                                                                                  top:3.0,bottom: 3.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius
                                                                                    .circular(
                                                                                        10),
                                                                            child:
                                                                                Container(
                                                                              height: 40,
                                                                              decoration:
                                                                                  BoxDecoration(
                                                                                color:
                                                    unread? Color.fromRGBO(33, 150, 243, 1)
                                                                                    .withOpacity(
                                                                                        0.3):Colors.grey.shade200.withOpacity(0.6),
                                                                                borderRadius:
                                                                                    BorderRadius.circular(
                                                                                        20),
                                                                              ),
                                                                              child:
                                                                                  Padding(
                                                                                padding: const EdgeInsets
                                                                                    .all(
                                                                                    4.0),
                                                                                child:
                                                                                    Row(
                                                                                  mainAxisSize:
                                                                                      MainAxisSize.min,
                                                                                  children: [
                                                                                    const SizedBox(
                                                                                      width:
                                                                                          10,
                                                                                    ),
                                                                                    Text(
                                                                                      "Unread",
                                                                                      style:          GoogleFonts.dmSans(
                                                                                         // fontSize: 12,
                                                                                          fontWeight: FontWeight.w400,
                                                                                          color: unread? Colors.blue.shade700:Colors.grey.shade700,
                                                                                        ),),
                                                                                    const SizedBox(
                                                                                      width:
                                                                                          10,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      
                              
                              ],
                            ),
                      ),
                    ],
                  ),                  
               all?    ChatListTile(
            name: 'John Doe',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):unread?ChatListTile(
            name: 'John Doe',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):SizedBox(),
          all? ChatListTile(
            name: 'John Doe',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):SizedBox(), 
          
          all?ChatListTile(
            name: 'John Doe',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):SizedBox(),
          all?ChatListTile(
            name: 'Jane Smith',
            lastMessage: 'Meeting at 2 PM',
            avatarUrl: 'https://example.com/avatar2.jpg',
            isRead: true,
          ):SizedBox(),
           all?      ChatListTile2(
            name: 'Group Name',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):groups?ChatListTile2(
            name: 'Group Name',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):SizedBox(),all?      ChatListTile2(
            name: 'Family Group',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):groups?ChatListTile2(
            name: 'Family Group',
            lastMessage: 'Hey, how are you?',
            avatarUrl: 'https://example.com/avatar.jpg',
            isRead: false,
          ):SizedBox(),
          ListTile(),            
            InkWell(
              onTap: (){
                setState(() {
                  adbx = adbx?false:true;
                });
              },
              child: Center(
                child: Container(
                  height: 50,
                  width:200,
                      //margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: 
                 Center(
                   child: Text(
                     'Send New Message',
                       style:          GoogleFonts.dmSans(
                      // fontSize: 12,
                       fontWeight: FontWeight.w600,
                       color: Colors.white,
                     ),
                   ),
                 ),
                          
                          
                      ),
                    ),
              ),
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
class ChatListTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String avatarUrl;
  final bool isRead;

  const ChatListTile({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.avatarUrl,
    this.isRead = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>ChatPage(title: name,)));
      }
      ,
      child: Dismissible(
        key: Key(name), // Unique key for each list tile
        background: Container(
          color: Colors.blue,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.more_horiz,
            color: Colors.white,
            size: 30,
          ),
        ),
        secondaryBackground: Container(
          color: Color(0xFF004AAD),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
                  children: [
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                  "More",
                   style:          GoogleFonts.dmSans(
                         // fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                 
                ),
                  ],
                ),
              ],
            ),
          ),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            // More options logic
            _showMoreOptions(context);
            return false; // Prevent actual dismissal
          } else if (direction == DismissDirection.startToEnd) {
            // Delete logic
            return await _showDeleteConfirmation(context);
          }
          return false;
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Image.asset("assets/image.png")),
            ),
          ),
          title: Text(
            name,
             style:          GoogleFonts.dmSans(
                   // fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
           
          ),
          subtitle: Text(
            lastMessage,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.dmSans(
              color: Colors.grey.shade700, //isRead ? Colors.grey : Colors.black,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1 hour ago', // Replace with actual timestamp
                
             style:          GoogleFonts.dmSans(
                    fontSize: 14,fontWeight: FontWeight.normal,
                    color:Color(0xFF004AAD),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.pin_drop),
                title: const Text('Pin Chat'),
                onTap: () {
                  Navigator.pop(context);
                  // Add pin logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.archive),
                title: const Text('Archive Chat'),
                onTap: () {
                  Navigator.pop(context);
                  // Add archive logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_off),
                title: const Text('Mute Notifications'),
                onTap: () {
                  Navigator.pop(context);
                  // Add mute logic
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _showDeleteConfirmation(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Chat'),
          content: const Text('Are you sure you want to delete this chat?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    ) ?? false;
  }
}

class ChatListTile2 extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String avatarUrl;
  final bool isRead;

  const ChatListTile2({
    Key? key,
    required this.name,
    required this.lastMessage,
    required this.avatarUrl,
    this.isRead = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>ChatPage(title: name,)));
      
        
      },
      child: Dismissible(
        key: Key(name), // Unique key for each list tile
        background: Container(
          color: Colors.blue,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.more_horiz,
            color: Colors.white,
            size: 30,
          ),
        ),secondaryBackground: Container(
          color: Color(0xFF004AAD),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
                  children: [
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                  "More",
                   style:          GoogleFonts.dmSans(
                         // fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                 
                ),
                  ],
                ),
              ],
            ),
          ),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            // More options logic
            _showMoreOptions(context);
            return false; // Prevent actual dismissal
          } else if (direction == DismissDirection.startToEnd) {
            // Delete logic
            return await _showDeleteConfirmation(context);
          }
          return false;
        },
        child: ListTile(
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundImage:  AssetImage("assets/Group 177013.png")
                
              ),
              Positioned(
                bottom: -1,
                right: -5,
                child: CircleAvatar(
                radius: 8,
                backgroundImage:  AssetImage("assets/Ellipse 83.png")
                
              ),)
            ],
          ),
          title: Text(
            name,
             style:          GoogleFonts.dmSans(
                   // fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
           
          ),
          subtitle: Row(
            children: [
              Text(
                "Anna: " ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                
             style:          GoogleFonts.dmSans(
                   // fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004AAD)
                  ),
              ),
              Text(
                lastMessage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.dmSans(
                  color: Colors.grey.shade700, //isRead ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1 hour ago', // Replace with actual timestamp
                
             style:          GoogleFonts.dmSans(
                   fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF004AAD)
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.pin_drop),
                title: const Text('Pin Chat'),
                onTap: () {
                  Navigator.pop(context);
                  // Add pin logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.archive),
                title: const Text('Archive Chat'),
                onTap: () {
                  Navigator.pop(context);
                  // Add archive logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.notifications_off),
                title: const Text('Mute Notifications'),
                onTap: () {
                  Navigator.pop(context);
                  // Add mute logic
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _showDeleteConfirmation(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Chat'),
          content: const Text('Are you sure you want to delete this chat?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    ) ?? false;
  }
}
