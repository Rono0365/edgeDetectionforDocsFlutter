//author: Kiprono N.
import 'dart:async';
import 'dart:convert';
import 'dart:math' show cos, sqrt, asin;
import 'package:avatar_glow/avatar_glow.dart';
//import 'package:edge3/accounts/profile.dart';
import 'package:edge3/pages/page1.dart';
import 'package:edge3/pages/page2.dart';
import 'package:edge3/pages/page3.dart';
//import 'package:edge3/pages/page4.dart';
//import 'package:edge3/pages/page5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyApp_home extends StatefulWidget {
  const MyApp_home(
      {super.key,  required this.title, required this.token, required this.userid});

  final String token;
  final String title;
  final String userid;

  @override
  State<MyApp_home> createState() => _MyApp_homeState();
}

class _MyApp_homeState extends State<MyApp_home> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,//hell yeah
    ]);
    return MaterialApp(
        title: 'Docs',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // ignore: deprecated_member_use
        home: WillPopScope(
            onWillPop: () async {
              // Return true to prevent the user from going back.
              return true;
            },
            child: MyHomePage(
              title: widget.title,
              token: widget.token,
              userid: widget.userid,
            ) // MyHomePage(title: 'OneStack'),
            ));
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage(
      {super.key,  required this.title, required this.token, required this.userid});

  final String title;
  final String token;
  final String userid;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  //final audioCache = AudioPlayer();
  var flutterToast;
  String _scanBarcode = 'Unknown';
  
  var subj;
  
  retball() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.withOpacity(0.5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon(Icons.check),

          Text("",
              style: TextStyle(color: darkmode ? Colors.white : Colors.black)),
        ],
      ),
    );

    /*flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP_RIGHT,
      toastDuration: const Duration(seconds: 2), msg: '',
    );*/
  }
  Future createAlbum(String scanned) async {
    //print(utf8.encode(titleController.text));
    ////print(titleController.text);
    //pinned
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.18:8000/information/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
      body: jsonEncode(<String, String>{
        //'id': titleController.text,this is an autofield
        'title': 'message', //an actual title
        'whoiswho': scanned,
        //'image':'null',
        'writer': "sky2[username]".toString(), //class teacher
        'mation':[(widget.userid.toString()),(widget.token.toString()),("sky2[username]".toString()),].toString(),
        'to': "sky2[username]".toString(), //class
        'date':
            '$now|$leo'
      }),
    );
    ////print(jsonDecode(response1.data.toString()) );
    //works => //print(token['token']);
    //print(jsonDecode(response1.body.toString()));
    if (response1.statusCode == 201) {
      //print("yea it happened");
      //print(jsonDecode(response1.body.toString()));
    }

    //});
//save the token for next time
  }
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.

   
    //here's  functs
    //final _controller = ScrollController();

    void senE(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Invalid "),
          content: Text("Didn't get the qrcode"),
        ),
      );
    }

    //add the http request here

    setState(() {
      _scanBarcode =" barcodeScanRes";
      //print(_scanBarcode.toString());
      final id = _scanBarcode.length;
      //print(barcodeScanRes.substring(2, id));
      //this.getScan(_scanBarcode.toString());
    });
    //if (barcodeScanRes != true) return _launchURL(_scanBarcode.toString());
    //&&
        //barcodeScanRes.toString().split('|')[0] == "OneStack"

    if ("oo" != '-1' ) {
      //print(barcodeScanRes.length);
      //FlutterBeep.beep();
      //createAlbum(barcodeScanRes);
      Navigator.pop(
        context,
      );
      //htp post herepost
      //getScan(barcodeScanRes.toString());
      //getScan2(barcodeScanRes.toString());
    } else {
      senE(context);
    }
  }

  final int _counter = 0;
  int overlaycounter = 0;
  var sky =["tr"];
  bool nconfetti = false;
  var users ;
  bool _isTutorialEnabled =
      false; //default state should be false..quite important
  var sky2=["tr"];
  //late ConfettiController _controllerCenter;
  var sky3=["tr"];
  bool kala1 = true;
  var pic_url ={};
  var oldstuff =["tr"];
  var rollcall =["tr"];
  var studentdet =["tr"];
  var stages =["tr"];
  var notef =["tr"];
  var cattendance =["tr"];
  var transolutuion =["tr"];
  var sbuss =["tr"];
  var students =["tr"];
  var long1 = "";
  var lat1 = "";
  bool xplayed = false;
  bool xrev = false;
  var verifiedx ;
  var HW ;
  var thislove = '';
  var messages ;
  var messages2 ;
  var grades ;
  bool tranzon = false;
  bool open3 = false;
  String getBus = "";
  var now;
  var findstudent ;
  bool onApp = true;
  bool newchat = false;
  bool appentry = false;
  var leo;
  var note7;
  var note8;
  var titleController;
  var information ;
  bool ee7 = false;
  bool ee8 = false;
  int _currentIndex = 0;
  bool darkmode = false;
  //Color icon = darkmode ? Colors.white:Colors.black;//darkmode?Colors.grey[900]:Colors.white
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * 1000 * asin(sqrt(a)); //* 1000
  }
/*
  getName(var studata, var infome) {
    //widget.studata // widget.findstudent["image"]
    var cln = studata.where((x) => x["adm_no"] == infome);

    var opend2 = cln;
    var nre1 = opend2?.map((x) => x["owner"]).toList();
    //var cln2 = cln.contains("${infome}");

    return nre1.last.toString();
  }

  scanbadge() {
    showModalBottomSheet(
        enableDrag: true,
        backgroundColor: Colors.transparent,

        //student id card here
        context: context,
        builder: (context) {
          /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
          return SizedBox(
           // height: getHdimention(390),
                            width: MediaQuery.of(context).size.width,
            child: AlertDialog(
              elevation: 0.0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              backgroundColor: darkmode ? Colors.grey.shade900 : Colors.white,
              title: Column(
                children: [
                  Center(
                      child: Container(
                    padding: const EdgeInsets.all(10.0),
                    height: 8,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade800),
                  )),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                
               height:MediaQuery.of(context).size.width,//MediaQuery.of(context).size.height * .35,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Container(
                    padding:const EdgeInsets.all(5),
                      //x["skills"] .toString().replaceAll("[","").replaceAll("]","").split(",")
                      height:MediaQuery.of(context).size.height*.16,
                      child: ListView(children: [
                        ListTile(
                            title: Text(
                              "Are you sure?",
                              style: GoogleFonts.dmSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal,
                                  color: darkmode?
                                  Colors.white:Colors.black),
                            ),
                            subtitle: Text(
                              "You will need to use your email address for the sign-in process. ",
                              style: GoogleFonts.dmSans(
                                  fontSize:  18,//getWdimention(19),
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),

                            )),
                        // ListTile()
                      ])),
                      SizedBox(height: 15,),
                  InkWell(
                      onTap: () {
                                                  scanQR();

                      },
                    child: Container(
                      height: getHdimention(50),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue,
                      ),
                      child: Center(
                          child: InkWell(
                        onTap: () {
                          scanQR();
                        },
                        child: Text("Proceed",
                            style: GoogleFonts.dmSans(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      )),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.transparent,
                    ),
                    child: Center(
                        child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel",
                          style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.w500,
                            color: darkmode?Colors.white:Colors.black,
                          )),
                    )),
                  )
                ]),
              ),
            ),
          );
        });
  }

  verified8() async {
   
    //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/verified2/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('findstudent', json.encode(verified1));
    setState(() {
      findstudent = verified1;
    });

    //print(verifiedx);
    //}

  }

  verifiedxl() async {
    
    //utf8.decode(responsev.bodyBytes) brings out the emoji
    final verified = await http.get(
      Uri.parse('http://192.168.100.18:8000/verified/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //info3
    var verified1 = jsonDecode(utf8.decode(verified.bodyBytes));
    // var seen1 = jsonDecode(utf8.decode(seen.bodyBytes));
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    //sharedPreferences.setString('comnav2', json.encode(info));
    sharedPreferences.setString('verifiedx', json.encode(verified1));
    setState(() {
      verifiedx = verified1;
    });

    //print(verifiedx);
    //}

  }

  getStudent() async {
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.18:8000/students/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
    );
    var result5 = jsonDecode(response1.body);
    setState(() {
      studentdet = result5;
    });
  }

  getsubjects() async {
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.18:8000/Subjects/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
    );
    var result5 = jsonDecode(response1.body);
    setState(() {
      subj = result5;
    });
  }

  getgrades() async {
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.18:8000/grades/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
    );
    var result5 = jsonDecode(response1.body);
    setState(() {
      grades = result5;
    });
  }

  getOtherAccounts() async {
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.18:8000/event/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
    );
    var result5 = jsonDecode(response1.body);
    setState(() {
      users = result5;
    });
  }

  getHW() async {
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.18:8000/HW/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
    );
    var result5 = jsonDecode(response1.body);
    setState(() {
      HW = result5;
    });
  }

  getunfo() async {
    http.Response response1 = await http.get(
      Uri.parse('http://192.168.100.18:8000/watus/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }, //'id','sender','message_me','receiver','time'
    );
    var result5 = jsonDecode(response1.body);
    setState(() {
      sky3 = result5;
    });
  }

  Future getMe() async {
    String token = widget.token.toString();
    String id = widget.userid.toString();

    print('here' + token);
    print('here' + id);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response responsev = await http
        .get(Uri.parse('http://192.168.100.18:8000/meff/$id/'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      sky2 = xcv;
    });
    //print(sky2);
  }

  Future inm() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('pic_url', json.encode(pic_url));
    sharedPreferences.setString('sky3', json.encode(sky3));
    sharedPreferences.setString('sky2', json.encode(sky2));
    sharedPreferences.setString('sky', json.encode(sky));
    sharedPreferences.setString('sbuss', json.encode(sbuss));
    sharedPreferences.setBool('ee7', ee7);
    sharedPreferences.setBool('darkmode', darkmode);
    sharedPreferences.setBool('ee8', ee8);
    sharedPreferences.setString('HW', json.encode(HW));
    sharedPreferences.setString('note8', json.encode(note8));
    sharedPreferences.setString('users', json.encode(users));

    //var passed5 = jsonDecode(sharedPreferences.setString('HW'));
    //var passed6 = jsonDecode(sharedPreferences.getString('ee8'));
    //var sky;
    //var sky2;
    //var sky3;
    //sharedPreferences.setString('passed', "passed");
  }
*/
  /*getmytrip() {
    String getDroopo(String val) {
      var vaav = {
        "5.30 am": "Trip 4",
        "6.30 am": "Trip 3",
        "7.30 am": "Trip 2",
        "8.00 am": "trip 1",
      };
      var vaav2 = {
        "5.30 am": "Trip 1",
        "6.30 am": "Trip 2",
        "7.30 am": "Trip 3",
        "8.00 am": "trip 4",
      };
      var xcc = vaav2[val].toString();
      return xcc;
    }

    var trip = sky3.reversed
        .where((k) => k["username"] == "sky2[username]")
        .take(1)
        .toList()
        ?.map((e) => e['likes'].replaceAll("[", "").replaceAll("]", ""))
        .toList();

    return getDroopo(trip.toString().replaceAll("[", "").replaceAll("]", ""));
  }*/



  Future getWeather3x() async {
    String token = widget.token.toString();
    String id = widget.userid.toString();

    ////print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response picpic1 = await http
        .get(Uri.parse('http://192.168.100.18:8000/profpic/'), headers: headers);
    //var results = jsonDecode(responsev.body);
    var picpic = jsonDecode(picpic1.body);
    http.Response responsev = //http://172.16.12.17:8000/
        await http.get(Uri.parse('http://192.168.100.18:8000/watus/'),
            headers: headers);
    
    var results = jsonDecode(responsev.body);
    //var results2 = jsonDecode(responsev2.body);
    setState(() {
      sky3 = results;
      pic_url = picpic;
      //sky2 = results2;
      //inm();
      //print("SKY2"+sky2.toString());
    });
  }

  Future getValidation() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance(); //jsonDecode(sharedPreferences.getString('value2'));
    var passed =
        jsonDecode("${sharedPreferences.getString('pic_url')}"); //alredy passed here
    var passed2 = jsonDecode("${sharedPreferences.getString('sky3')}");
    var passeD3 = jsonDecode(sharedPreferences.getString('sky2')!);
    var passeD3x = jsonDecode(sharedPreferences.getString('sbuss')!);
    var passed4 = jsonDecode(sharedPreferences.getString('sky')!);
    var passedq = jsonDecode(sharedPreferences.getString('HW')!);
    var passedq1 = jsonDecode(sharedPreferences.getString('users')!);
    var passed5 = sharedPreferences.getBool('ee7');
    var passed6 = sharedPreferences.getBool('ee8');
    var passedqa = sharedPreferences.getBool('darkmode');
    var passed7 = jsonDecode(sharedPreferences.getString('findstudent')!);
    var passed8 = jsonDecode(sharedPreferences.getString('note8')!);

    setState(() {
     
      pic_url = passed;
      sky3 = passed2;
      sky2 = passeD3;
      sky = passed4;
      sbuss = passeD3x;
      darkmode = passedqa!;
      ee7 = passed5!;
      users = passedq1;
      ee8 = passed6!;
      HW = passedq;
      findstudent = passed7;
      note8 = passed8;
      print("gettingvalidation");
      appentry = true;
      print("pic-url$pic_url");
      print("asky2$sky2");
      print("sky3$sky3");
    });
  }

  /*bess() {
    var counter = 90;
    Timer.periodic(const Duration(seconds: 5), (timer) {
      //http req to  and from server
      counter++;

      if (counter == 0) {
        //counter = 15;

        //timer.cancel();
      } else {
        retrieveMessages("sky2[username]");
        // this.retrieveTransit("RetRono");
        messages!=null ? menw(messages) : "";
      }
    });
  }*/

  pagestarter() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        //isScrollControlled: true,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                height: 300,
                width: 320,
                //         color:Colors.grey.shade900,
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        "Notify Driver",
                        style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      trailing: InkWell(
                          onTap: () {
                           
                          },
                          child: const Icon(Ionicons.settings_outline,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: Row(children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 60,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade800,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0))),
                                  child: Center(
                                    child: Wrap(
                                        alignment: WrapAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "not going today",
                                                  style: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ])),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: Row(children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  /*  Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => fteacher(
                                                       pic_url: widget.pic_url,
                                              username: "sky2[username]",
                                              information: widget.information,
                                              token: widget.token,
                                                    )));*/
                                },
                                child: Container(
                                  height: 60,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color:
                                          Colors.blue.shade900.withOpacity(0.1),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0))),
                                  child: Center(
                                    child: Wrap(
                                        alignment: WrapAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  "Cancel",
                                                  style: GoogleFonts.dmSans(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              height: 150,
              color: Colors.transparent,
            ),
          );
        });
  }
  getWdimention(int x) {
    var width = MediaQuery.of(context).size.width;
    var convertedWidth = (x.round()) / 350 * width;

    return convertedWidth;
  }
  getHdimention(int x) {
   double height = MediaQuery.of(context).size.height;
   double convertedHeight = (x.round()) / 760 * height;
   return convertedHeight;
  }

  @override
  void initState() {
    super.initState();
   
     //flutterToast = Fluttertoast;
    leo = "today";//DateFormat('EEEE d MMM').format(DateTime.now());
    now ="sahii";
        //DateFormat('EEEE d MMM').format(DateTime.now()); //returns json body from api
//    });

    //pagestarter();
    onApp = true;
    //print("pic-url"+pic_url.toString());
     // print("asky2"+sky2.toString());
     // print("sky3"+sky3.toString());
  // pic_url==null?"": getValidation();
    
  //  getMe();
   // verifiedxl();
   // getWeather3x();
   // verified8();
   // getStudent();
   // getHW();
   // getunfo();
  //getmybusstop();
  // getmytrip();
  //getOtherAccounts();
  //getsubjects();
 // getgrades();
  //bess();
  information ==null?'': getstacks();
  widget.title != "Buswise"
      ? ""
      :  true
          ? Future.delayed(const Duration(seconds: 5)).then((_) {
              
                      showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              //isScrollControlled: true,
                              builder: (context) {
                                return Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade900,
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              bottomLeft:
                                                  Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0))),
                                      height: 300,
                                      width: 320,
                                      //         color:Colors.grey.shade900,
                                      padding: const EdgeInsets.all(20.0),
                                      child: ListView(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              "Learn the basics",
                                              style: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                            
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Card(
                                                  elevation: 0,
                                                  color: Colors.transparent,
                                                  child: Row(children: [
                                                    InkWell(
                                                      onTap: () {
                                                          _isTutorialEnabled = true;
                              
                                              Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 250,
                                                        decoration: BoxDecoration(
                                                            color: Colors.grey
                                                                .shade800,
                                                            borderRadius: const BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0))),
                                                        child: Center(
                                                          child: Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets.all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Text(
                                                                        "Proceed",
                                                                        style:
                                                                            GoogleFonts.dmSans(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              17,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ])),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Card(
                                                  elevation: 0,
                                                  color: Colors.transparent,
                                                  child: Row(children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(
                                                            context);
                                                        /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreenfteacher(
                                          pic_url: widget.pic_url,
                                username: widget.username,
                                information: widget.information,
                                token: widget.token,
                                      )));*/
                                                      },
                                                      child: Container(
                                                        height: 60,
                                                        width: 250,
                                                        decoration: BoxDecoration(
                                                            color: Colors
                                                                .blue.shade900
                                                                .withOpacity(
                                                                    0.1),
                                                            borderRadius: const BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomLeft:
                                                                    Radius.circular(
                                                                        20.0),
                                                                bottomRight:
                                                                    Radius.circular(
                                                                        20.0))),
                                                        child: Center(
                                                          child: Wrap(
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets.all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Text(
                                                                        "Skip",
                                                                        style:
                                                                            GoogleFonts.dmSans(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              17,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ])),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  bottomNavigationBar: Container(
                                    height: 150,
                                    color: Colors.transparent,
                                  ),
                                );
                              });
                  
              })
          : "";
    
  }

  @override
  void dispose() {
    super.dispose();
    //_controllerCenter.dispose();
    //inm();

    onApp = false;
  }
/*
  
  String menw3(List z) {
    //time
    var w = z.where((e) => e != null).toList();

    var y = '';

    if (w.length > 1) {
      var x = w;
      y = x[3].toString();
    }

    return y;
  }

  getme2(String qx) {
    final x2 = messages ?? [];
    // final v = x.last;
    final mess2 = x2?.map((z) => z[1]);
    //final mess = x?.map((z)=>z[1]);
    final listOfMes2 = mess2.where((x1) => x1[0] == qx);
    //final list_of_mes= mess.where((x1)=>x1[0] == "RetRono");//here get the righth users
    return listOfMes2.toList();
  }

  getFirstTwoValues2(List list) {
    List a = list;
    var b = menw3(a);
    return b.toString();
  }

  

  lastmess(var z) {
    var k = z.split("],").where((e) => e != null).last;
    return k
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(",", "|")
        .split("|");
  }

  void retrieveMessages(String room) async {
    final url =
        Uri.parse('https://p2psocketchat.onrender.com/messages/$room');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final messageList = data['messages']; //
      // final trip = data["trip"];
      setState(() {
        messages = messageList;

        //retrievep(mUsername);
      });
    } else {
      // retball();
      //notify user can't connect
      //print('Failed to retrieve messages. Error: ${response.statusCode}');
    }
  }


  getstudent2() {
    var x = findstudent
        .where((ui) => ui['username1'] == "sky2[username]".toString());

    return [];//x.toList().reversed.first;
  }


  List<dynamic> menw(List<dynamic> z) {
    // this is A masterpiece
    List<dynamic> up = oldstuff;
    List<dynamic> w = z.isEmpty
        ? []
        : z.reversed
            .where((element) =>
                element.length > 1 &&
                element[1].length > 0 &&
                element[1][0] != null)
            .map((e) => e[1][0])
            .toSet()
            .toList();

    if (thislove != getFirstTwoValues2(lastmess(getme2(w.first).toString()))) {
      //audioCache.play(AssetSource("sendsmth.mp3")); //assets/
      /*note(w.first.toString(),
              w.toString());*/ //!onApp ? note(w.first.toString(), w.toString()) : ""; //remove this on app
      setState(() {
        ee7 = true;
      });

      up.remove(getFirstTwoValues2(lastmess(getme2(w.first).toString())));
    }

    List<dynamic> itemsNotInUp = w.where((item) => !up.contains(item)).toList();

    setState(() {
      thislove = getFirstTwoValues2(lastmess(getme2(w.first).toString()));
    });

    return itemsNotInUp;
  }

  */Widget bN(String pressed, String Page) {
    return sky2 == null && pic_url ==null
        ? Container(
            color: darkmode ? Colors.grey[900] : Colors.white,
            child: const Center(child: LinearProgressIndicator()))
        : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  darkmode
                      ? Colors.black.withOpacity(0.0)
                      : Colors.white.withOpacity(0.0),
                  darkmode
                      ? Colors.black.withOpacity(0.9)
                      : Colors.white.withOpacity(0.9),
                  darkmode
                      ? Colors.black.withOpacity(1.0)
                      : Colors.white.withOpacity(
                          1.0) //darkmode?Colors.grey[900]:Colors.grey[100]
                ],
                stops: const [0.1, 0.7, 1],
              ),
            ),
            height: 100,
            //color: Colors.black.withOpacity(.85),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               InkWell(
                  onTap: () {
                    //_pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

                    setState(() {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);

                      _currentIndex = 0;
                    });
                   // inm();
                  },
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor:
                        Colors.transparent, //no outlineColors.deepOrange
                    child:  Icon(
                          pressed == "0"
                              ? Ionicons.home
                              : Ionicons.home_outline,
                          size: pressed == "0" ? 32 : 27,
                          color: pressed == "0"
                              ? Colors.blue
                              : darkmode
                                  ? Colors.white
                                  : Colors
                                      .blue), //darkmode?Colors.grey[900]:Colors.white
                     //Icon(Ionicons.home_outline,color: Colors.deepOrange,),
                  )
                ),  
                /*InkWell(
                  onTap: () {
                    setState(() {
                      _pageController.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                      _currentIndex = 2;
                      //pressed = "Work";
                    });
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                        pressed == "2"
                            ? Ionicons.briefcase
                            : Ionicons.briefcase_outline,
                        color: pressed == "2"
                            ? Colors.blue
                            : Colors.white),
                  ),
                ),*/
                        InkWell(
                  onTap: () {
                    //_pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

                    setState(() {
                      _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);

                      _currentIndex = 1;
                    });
                 //   inm();
                  },
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor:
                        Colors.blueAccent, //no outlineColors.blue
                    child:  Icon(
                          pressed == "1"
                              ? Icons.document_scanner_outlined
                              :  Icons.document_scanner_outlined,
                          size: pressed == "1" ? 32 : 27,
                          color: pressed == "1"
                              ? Colors.white
                              : darkmode
                                  ? Colors.white
                                  : Colors
                                      .white), //darkmode?Colors.grey[900]:Colors.white
                    //Icon(Ionicons.home_outline,color: Colors.blue,),
                  ),
                ),
              
                /* pressed == "4"
                    ? Container(
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.blue,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.cyan.shade100,
                              child: Center(
                                child: Text(
                                  "sky2[username]".toString().substring(0, 1),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ...pic_url ==null
                              ? [
                                  {
                                    "id": 126,
                                    "username1": "RonoRet",
                                    "image":
                                        "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                  },
                                  {
                                    "id": 127,
                                    "username1": "RetRono",
                                    "image":
                                        "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                  }
                                ]
                                  .where((c) =>
                                      c['username1'] ==
                                      sky2['username'].toString())
                                  ?.map(
                                    (ui) => CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.blue,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: NetworkImage(
                                          ui['image'].toString(),
                                        ), //ui['image'],
                                      ),
                                    ),
                                  )
                              : pic_url
                                  .where((c) =>
                                      c['username1'] ==
                                      sky2['username'].toString())
                                  ?.map(
                                    (ui) => CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.blue,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.transparent,

                                        backgroundImage: NetworkImage(
                                          ui['image'].replaceAll(" ", ''),
                                        ), //ui['image'],
                                      ),
                                    ),
                                  ),
                        ]),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            _pageController.animateToPage(4,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                            _currentIndex = 4;
                          });
                        },
                        child: Container(
                          child: Stack(children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.cyan.shade100,
                              child: Center(
                                child: Text(
                                  "sky2[username]".toString().substring(0, 1),
                                  style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            ...pic_url ==null
                                ? [
                                    {
                                      "id": 126,
                                      "username1": "RonoRet",
                                      "image":
                                          "https://lh3.googleusercontent.com/a/AGNmyxah06KcliVpATNE55plMrDpiJLTxvMbw7pgf5K2=s96-c"
                                    },
                                    {
                                      "id": 127,
                                      "username1": "RetRono",
                                      "image":
                                          "https://lh3.googleusercontent.com/a/AGNmyxYD0O3MyJWgtQls1C130TmBHNXJ4IQkPzgysnhI=s96-c"
                                    }
                                  ]
                                    .where((c) =>
                                        c['username1'] ==
                                        (sky2 ==null ? "" : sky2['username']))
                                    ?.map(
                                      (ui) => CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.blue,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.transparent,

                                          backgroundImage: NetworkImage(
                                            ui['image'].toString(),
                                          ), //ui['image'],
                                        ),
                                      ),
                                    )
                                : pic_url
                                    .where((c) =>
                                        c['username1'] ==
                                        (sky2 ==null
                                            ? ""
                                            : "${sky2['username']}"))
                                    ?.map((ui) => CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.transparent,

                                          backgroundImage: NetworkImage(
                                            ui['image']
                                                .toString()
                                                .replaceAll(" ", ''),
                                          ), //ui['image'],
                                        )),
                          ]),
                        )),*/
                  InkWell(
                  onTap: () {
                    //_pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

                    setState(() {
                      _pageController.animateToPage(3,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);

                      _currentIndex = 3;
                    });
                 //   inm();
                  },
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor:
                        Colors.transparent, //no outlineColors.blue
                    child:  Icon(
                          pressed == "3"
                              ? Ionicons.settings
                              : Ionicons.settings_outline,
                          size: pressed == "3" ? 32 : 27,
                          color: pressed == "3"
                              ? Colors.blue
                              : darkmode
                                  ? Colors.blue
                                  : Colors
                                      .blue), //darkmode?Colors.grey[900]:Colors.white
                    //Icon(Ionicons.home_outline,color: Colors.blue,),
                  ),
                ),
              ],
            )),
          );
  }

  getstacks() {
    /*
   information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString()
  */
    var k = information
        .where((x) => x["writer"] == "sky2[username]")
        .where((u) => u['title'].contains('mop'))
        .where((f) => f['id'] != null);
    var n = k
        .toList()
        ?.map((x) => information
            .where((u) =>
                u['title'].contains('message') &&
                u["writer"] != "sky2[username]" &&
                u['whoiswho'] == x['id'].toString())
            .length
            .toString())
        .toList();
    setState(() {
      note7 !=
              n
                  .fold(
                      0,
                      (previousValue, element) =>
                          int.parse(previousValue.toString()) +
                          int.parse(element.toString()))
                  .toString()
          ? ee8 = true
          : "";
    });
    return n
        .fold(
            0,
            (previousValue, element) =>
                int.parse(previousValue.toString()) +
                int.parse(element.toString()))
        .toString();
  }

  /*stacknotes() {
    /*
   information
                                                    .where((u) =>
                                                        u['title'].contains('message') &&
                                                        u['whoiswho'] ==
                                                            x['id'].toString())
                                                    .length
                                                    .toString()
  */
    var k = information
        .where((x) => x["whoiswho"] == "sky2[username]")
        .where((x) => x["to"] == "sky2[username]");
    var getlast = information
        .where((x) => x["to"] == "sky2[username]")
        .where((x) => x["date"].split("|")[0] == now);    
    //print(getlast.length);

    setState(() {
      note7 = k.length;
      ee8 = note8 == note7 ? false : getlast.isNotEmpty? true:false;
    });
    return note7.toString();
  }*/

  @override
  Widget build(BuildContext context) {
  //sky2=={} && messages.isNotEmpty?"": retrieveMessages("sky2[username]");//:"";
   //sky3==[]?"":getmybusstop();

    //sky3==[]?"":retrieveTransit(
    //  getmydriver()); //    : ""; //get Bus driver according to your area selection
    //sky3==[]?"":getmytrip();
    //messages.isNotEmpty ? menw(messages) : "";
    return WillPopScope(
      onWillPop: () async {
        // Return true to prevent the user from going back.
        return true;
      },
      child:/* sky2==null &&
              pic_url==null && findstudent ==null&& information==null&&
              sky3==null ? Scaffold(//SCREEn to display when loading first time
              backgroundColor: darkmode ? Colors.grey[900] : Colors.white,
              body: const Center(child: CircularProgressIndicator()))
          : */Stack(
                children: [
                  Scaffold(
                    extendBody: true,
                    backgroundColor:
                        darkmode ? Colors.grey[900] : Colors.white,
                    extendBodyBehindAppBar: _currentIndex == 8 ? true : false,
                    // _currentIndex != 4?
                    
                    appBar: 
                  PreferredSize(
  preferredSize: Size(MediaQuery.of(context).size.width, 110),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: AppBar(
      elevation: 0,
       toolbarHeight: 120,
      leading: Container(
        //alignment: const Alignment(-2, 1),
        child:   CircleAvatar(radius: 20,backgroundColor: Colors.transparent,child: 
 CircleAvatar(
  backgroundColor: Colors.grey.shade200.withOpacity(.6),
            radius:20,
            child: Center(child: Icon(Ionicons.menu_outline))),
        ),
      ),
      //elevation: 0,
      //automaticallyImplyLeading: false,
      backgroundColor: _currentIndex == 2 
        ? (darkmode ? Colors.grey[900]?.withOpacity(0.3) : Colors.white?.withOpacity(0.3))
        : (darkmode ? Colors.grey[900]?.withOpacity(0.3) : Colors.white?.withOpacity(0.3)),
      title: 
      
      Text(
                 'Home',
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
      actions:  [ 
            SizedBox(
              width: 60,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(radius: 20,backgroundColor: Colors.grey.shade200.withOpacity(0.6),
                   backgroundImage:  AssetImage("assets/Social Login Button@2x.png")
                  //child: //Icon(Ionicons.g),
                  ),
                Positioned(
                  
                  right: -2,
                  left: -20,
                  bottom: -25,
                  child: Center(child: Text("Groups",style: GoogleFonts.dmSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  
                  color: Colors.grey.shade700,
                ),)))
                ],
              ),
            ),
           SizedBox(
            width: 60,
             child: Stack(
                clipBehavior: Clip.none,
                children: [
                CircleAvatar(radius: 20,backgroundColor: Colors.grey.shade200.withOpacity(0.6),
                   backgroundImage:  AssetImage("assets/Social Login Button (1).png"))
                 , Positioned(
                  
                  right: -2,
                  left: -20,
                  bottom: -25,
                  child: Center(child: Text("Contacts",style: GoogleFonts.dmSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  
                  color: Colors.grey.shade700,
                ))))
                ],
              ),
           ),SizedBox(
            width: 60,
             child: Stack(
                clipBehavior: Clip.none,
                children: [
                CircleAvatar(radius: 20,backgroundColor: Colors.grey.shade200.withOpacity(0.6),
                   backgroundImage:  AssetImage("assets/Social Login Button (2).png")),
                Positioned(
                  right: -2,
                  left: -20,
                  bottom: -25,
                  child: Center(child: Text("Settings",style: GoogleFonts.dmSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  
                  color: Colors.grey.shade700,
                ))))
                ],
              ),
           ), 
            //_buildProfileButton(context),
            //  CircleAvatar(radius: 20,backgroundColor: Colors.blue,),
            //_buildProfileButton(context)
              
             // SizedBox(width: 13,)
             // CircleAvatar(radius: 5,backgroundColor: Colors.transparent,),
              ]
      
    ),
  ),
), 
                    /*bottomNavigationBar: //sky3
                        sky2==null
                            ? Container()
                            : bN(_currentIndex.toString(), ""),
                    
                            Controller.animateToPage(2, duration: Duration(milliseconds: 500));
                            */
                    body: sky2==null && sky3 ==null && pic_url ==null&& verifiedx ==null && information ==null
                            ? Scaffold(
                            backgroundColor: darkmode
                                ? Colors.grey[900]
                                : Colors.white,
                            body: const Center(child: CircularProgressIndicator()))
                        : PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            children:  [
                                 
                                 Page1(),//Page3(),Page2()//Page3(),Page4(),Page5(),
                                 /*
                                    sourceLatLng: LatLng(lat1, long1),
                          destinationLatLng: LatLng(-1.234, 34.7),
                                
                                    profile(
                                      pics: pic_url,
                                      unfo: sky3,
                                      information: information,
                                      token: widget.token,
                                      userid: int.parse(widget.userid), //widget.userid,
                                      username: sky2['username'],
                                    )*/
                              ]),
                  
                           ),
                  /*Positioned(
                    top: 200,
                    right:0,
                    child: SizedBox(
                      child: Center(
                        child: ConfettiWidget(
                          confettiController: _controllerCenter,
                          blastDirectionality: BlastDirectionality
                              .explosive, // don't specify a direction, blast randomly
                          shouldLoop:
                              false, // start again as soon as the animation is finished
                          colors: const [
                            Colors.green,
                            Colors.blue,
                            Colors.blue,
                            Colors.orange,
                            Colors.purple
                          ], // manually specify the colors to be used
                          //createParticlePath: drawStar, // define a custom shape/path.
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: SizedBox(
                      child: Center(
                        child: ConfettiWidget(
                          confettiController: _controllerCenter,
                          blastDirectionality: BlastDirectionality
                              .explosive, // don't specify a direction, blast randomly
                          shouldLoop:
                              false, // start again as soon as the animation is finished
                          colors: const [
                            Colors.green,
                            Colors.blue,
                            Colors.blue,
                            Colors.orange,
                            Colors.purple
                          ], // manually specify the colors to be used
                          //createParticlePath: drawStar, // define a custom shape/path.
                        ),
                      ),
                    ),
                  )*/
                ],
              ),
            
    );
  }
}

// Helper methods
Widget _buildTitleSection(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
       // color: Colors.white,
        height: 0),
      Positioned(
        //bottom: 20,
        child: Container(
          //alignment: const Alignment(-1, 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0)
          ),
         // height: MediaQuery.of(context).size.width * 0.2,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Home\n',
                  style: GoogleFonts.dmSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                /*TextSpan(
                  text: "John Doe,",
                  style: GoogleFonts.dmSans(
                    fontSize: 25,
                    fontWeight: FontWeight.w500, 
                    color: Colors.blue,
                  ),
                ),*/
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildProfileButton(BuildContext context) {
  return InkWell(
    onTap: () {
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 23,
            backgroundColor: Colors.blue,
            child: Center(
              child: Text(
                "JJ".substring(0, 1),
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
