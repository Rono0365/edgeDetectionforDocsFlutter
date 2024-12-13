import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  ChatPage({key,  required this.title});

  final String title;
  
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
    final List<ChatMessage> messages = [
    ChatMessage(
      sender: 'Anna Paul',
      message: 'Hi Brother! Not sure if the address is correct for this job.',
      time: 'Today 9:30 PM',
      isSender: false,
    ),
    ChatMessage(
      sender: 'You',
      message: 'Let me check but I think we had it right',
      time: 'Today 9:30 PM',
      isSender: true,
    ),
    // ... Add more messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
      
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        leadingWidth: 0,
        title: SizedBox(
          width: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                child: Center(
                  child: Icon(Icons.arrow_back_ios,color: Colors.white,
                  ),
                ),
                ),
              ),
              CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),//
                child: widget.title.contains("Group")? Center(child: Image.asset("assets/Group 177013.png")): Center(child: Image.asset("assets/image.png")),
              ),
            ),
            SizedBox(width: 9,),
              SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('${widget.title}',  style:          GoogleFonts.dmSans(
                                         // fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Active 20min ago',  style:          GoogleFonts.dmSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
                        
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Implement back navigation logic
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(),
            Text("Today"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.7,
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return ListTile(
                    title: Row(
                      mainAxisAlignment:
                          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        if (!message.isSender)
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                           // backgroundImage: AssetImage('assets/profile_pic.png'), // Replace with actual image
                          ),
                          SizedBox(width: 5,),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Flexible(
                              child: Container(
                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*.7),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                border: Border.all(
                                  color:!message.isSender ? Colors.blue:Colors.transparent,
                                  width: 1, // 1-pixel border width
                                ),
                                  color: message.isSender ? Colors.grey[200] : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(message.message),
                                    Text(message.time),
                                  ],
                                ),
                              ),
                            ),
                        !message.isSender ? Positioned(
                          left: -50,
                          bottom: 0,
                          child:  CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Image.asset("assets/image.png")),
                      ),
                    ),):SizedBox()
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
            padding: EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
          Container(
            height: 40,
            width: 40,
            //radius: 20,
            //backgroundColor: Colors.transparent,
            child:  Image.asset("assets/Group 1797 (1).png")
            
          ),
        SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width*.8,
          child: TextField(
            
            decoration: InputDecoration(
             fillColor: Color(0xFF004AAD),
              suffix: GestureDetector(
                onTap: () {
                  // Add your send button logic here
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                    ),
                    Positioned(
                      right: -5,
                      bottom: -11,
                      child: InkWell(
                        onTap: (){
            
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            shape: BoxShape.circle,
                            image: DecorationImage(image: 
                        AssetImage("assets/Group 1794 (1).png")                        )
                          ),
                          
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              hintText: 'Start typing a message',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF004AAD)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        
              ],
            ),
          )
          ],
        ),
      ),
     );
  }
}

class ChatMessage {
  final String sender;
  final String message;
  final String time;
  final bool isSender;
  

  ChatMessage({
    required this.sender,
    required this.message,
    required this.time,
    required this.isSender,
  });
}