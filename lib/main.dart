//author:Kiprono Ngetich
//Docapp
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:edge3/analyzer/docanalyzer.dart';
import 'package:edge3/pages/mainpage.dart';
//import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';
//import 'package:mlkit_document_scanner/mlkit_document_scanner.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:path_provider/path_provider.dart';
//import 'utils/file_utils.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image/image.dart' as img;
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';

void main() {
  runApp(const MyApp_home(title: "Darasa",token: "token",userid: "12",));
}
class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final class _MyAppState extends State<MyApp> {
  String imageBase64 = '';
  File? image;
  bool picbool = false;
  
  
 // final MlkitDocumentScannerPlugin _mlkitDocumentScannerPlugin =
 //     MlkitDocumentScannerPlugin(token: Object());
  //late final Stream<List<Uint8List>?> _jpegDocumentStream;
  //late final Stream<Uint8List?> _pdfDocumentStream;

  late TextRecognizer textRecognizer;
  late ImageLabeler imageLabeler;

  @override
  void initState() {
    super.initState();

    textRecognizer = TextRecognizer();
    imageLabeler = ImageLabeler(options: ImageLabelerOptions(
    confidenceThreshold: 0.7,  // Adjust the confidence threshold as needed
         // Set the language code for label text
  ),);
  }
  @override
  void dispose() {
    textRecognizer.close();
    imageLabeler.close();
    super.dispose();
  }
//Future<void> processImage2(var inputImage) async {
Future<File?> detectEdges(File inputImage) async {
  try {
    final imageBytes = await inputImage.readAsBytes();
    final image = img.decodeImage(imageBytes);
    if (image == null) return null;

    final grayscaleImage = img.grayscale(image);
    final blurredImage = img.gaussianBlur(grayscaleImage, radius: 5);
    
    final gradientX = img.sobel(blurredImage,);
    final gradientY = img.sobel(blurredImage,);
    
    final edgeImage = img.Image(width: blurredImage.width, height: blurredImage.height);
    
    for (var y = 0; y < blurredImage.height; y++) {
      for (var x = 0; x < blurredImage.width; x++) {
        final gx = gradientX.getPixel(x, y).r.toDouble();
        final gy = gradientY.getPixel(x, y).r.toDouble();
        
        final magnitude = sqrt(gx * gx + gy * gy);
        
        final edgeValue = (magnitude > 50) ? 255 : 0;
        edgeImage.setPixel(x, y, img.ColorUint8.rgb(edgeValue, edgeValue, edgeValue));
      }
    }

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/edge_image.png');
    await file.writeAsBytes(img.encodePng(edgeImage));
    
    return file;
  } catch (e) {
    print('Error detecting edges: $e');
    return null;
  }
}
processImage2(var inputImage) async {
  try {
    final imageBytes = await inputImage;
    final image = img.decodeImage(imageBytes);
    if (image == null) return null;

    final grayscaleImage = img.grayscale(image);
    final blurredImage = img.gaussianBlur(grayscaleImage, radius: 5);
    
    final gradientX = img.sobel(blurredImage);
    final gradientY = img.sobel(blurredImage);
    
    final edgeImage = img.Image(width: blurredImage.width, height: blurredImage.height);
    
    for (var y = 0; y < blurredImage.height; y++) {
      for (var x = 0; x < blurredImage.width; x++) {
        final gx = gradientX.getPixel(x, y).r.toDouble();
        final gy = gradientY.getPixel(x, y).r.toDouble();
        
        final magnitude = sqrt(gx * gx + gy * gy);
        
        final edgeValue = (magnitude > 50) ? 255 : 0;
        edgeImage.setPixel(x, y, img.ColorUint8.rgb(edgeValue, edgeValue, edgeValue));
      }
    }
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/edge_image.png');
    await file.writeAsBytes(img.encodePng(edgeImage));
    
    return file;
    //return edgeImage;
  } catch (e) {
    print('Error processing image: $e');
    return null;
  }
}
  /*Future<void> processImage(var inputImage) async {
  final image = await inputImage.convertToImage();
  final pixelProvider = image.image;

  // Convert the image to a grayscale image for edge detection
  final grayscaleImage = await pixelProvider.toImage(
    configuration: ImageConfiguration(
      size: pixelProvider.size,
      //olorSpace: ColorSpace.deviceGray,
    ),
  );

  // Apply edge detection algorithm (e.g., Canny edge detection)
  final edgesImage = await grayscaleImage.clone(filter: ui.Filter.blur(sigmaX: 0.5, sigmaY: 0.5));
  final edgeDetector = CannyEdgeDetector();
  final edges = await edgeDetector.detectEdges(edgesImage);

  // Process the detected edges (e.g., find contours, identify document boundaries)
  // ...

  // Close the image and edge detector
  await image.dispose();
  await edgeDetector.close();
}*/
Future pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() async {
      image = File(pickedImage.path);
      final List<int> imageBytes = await image!.readAsBytes();
      imageBase64 = base64Encode(imageBytes);
    });
  }


  @override
  Widget build(BuildContext context) {
    picbool?WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height*.95,
            child: 
            Column(children:[
              SizedBox(
                height:30
               , child: Center(
                  child: Container(
                    height: 10,
                    width:MediaQuery.of(context).size.width*.2,
                                        
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.file(
                                        image! ,
                                        height: MediaQuery.of(context).size.height*.6,
                                        width:MediaQuery.of(context).size.width,
                                        //width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                  ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*.2,
                width: MediaQuery.of(context).size.width*.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                 InkWell(
                  onTap: (){
                    
                  },
                   child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.green.shade400,
                    child: Center(
                      child: Icon(Icons.check,color: Colors.white,),
                    ),
                   ),
                 ),
                 InkWell(
                  onTap: (){},
                   child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.red.shade400,
                    child: Center(
                      child: Icon(Icons.close,color: Colors.white,),
                    ),
                   ),
                 )   
                    
                    ],
                ),
              ),
            ),  
            ])
            
          );
        },
      );
    }):"";
                    
    return  Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                height:MediaQuery.of(context).size.height*.75,
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          onMediaCaptureEvent: (event) {
            switch ((event.status, event.isPicture, event.isVideo)) {
              case (MediaCaptureStatus.capturing, true, false):
                print("taking pic: }");
                debugPrint('Capturing picture...');
              case (MediaCaptureStatus.success, true, false):
                event.captureRequest.when(
                  single: (single) async{
                    //print("Picture saved: ${single.file?.path}");
                    debugPrint('Picture saved: ${single.file?.path}');
                    image = File(single.file!.path);
                    final List<int> imageBytes = await image!.readAsBytes();
                    imageBase64 = base64Encode(imageBytes);//processImage2(base64Decode(imageBase64));
                    //add bool then pop a screen with the image
                    setState((){
                      picbool = true;
                      //detectEdges(File(single.file!.path))
                      //final imageFile = File('path/to/your/image.jpg'); // Replace with actual path
                      //final inputImage = InputImage.fromFilePath(imageFile.path);

                      //
                      
                  });

                                },

                  multiple: (multiple) {
                    multiple.fileBySensor.forEach((key, value) {
                      debugPrint('multiple image taken: $key ${value?.path}');
                    });
                  },
                );
              case (MediaCaptureStatus.failure, true, false):
                debugPrint('Failed to capture picture: ${event.exception}');
              case (MediaCaptureStatus.capturing, false, true):
                debugPrint('Capturing video...');
              case (MediaCaptureStatus.success, false, true):
                event.captureRequest.when(
                  single: (single) {
                    debugPrint('Video saved: ${single.file?.path}');
                  },
                  multiple: (multiple) {
                    multiple.fileBySensor.forEach((key, value) {
                      debugPrint('multiple video taken: $key ${value?.path}');
                    });
                  },
                );
              case (MediaCaptureStatus.failure, false, true):
                debugPrint('Failed to capture video: ${event.exception}');
              default:
                debugPrint('Unknown event: $event');
            }
          },
          saveConfig: SaveConfig.photoAndVideo(
            initialCaptureMode: CaptureMode.photo,
            photoPathBuilder: (sensors) async {
              final Directory extDir =await getTemporaryDirectory();
              
              final testDir = await Directory(
                '${extDir.path}/camerawesome',
              ).create(recursive: true);
              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                return SingleCaptureRequest(filePath, sensors.first);
              }
              // Separate pictures taken with front and back camera
              return MultipleCaptureRequest(
                {
                  for (final sensor in sensors)
                    sensor:
                        '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                },
              );
            },
            videoOptions: VideoOptions(
              enableAudio: true,
              ios: CupertinoVideoOptions(
                fps: 10,
              ),
              android: AndroidVideoOptions(
                bitrate: 6000000,
                fallbackStrategy: QualityFallbackStrategy.lower,
              ),
            ),
            exifPreferences: ExifPreferences(saveGPSLocation: true),
          ),
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.back),
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_4_3,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          // filter: AwesomeFilter.AddictiveRed,
          previewAlignment: Alignment.center,
          previewFit: CameraPreviewFit.contain,
          onMediaTap: (mediaCapture) {
            mediaCapture.captureRequest.when(
              single: (single) {
                debugPrint('single: ${single.file?.path}');
                //single.file?.open();
              },
              multiple: (multiple) {
                multiple.fileBySensor.forEach((key, value) {
                  debugPrint('multiple file taken: $key ${value?.path}');
                  //value?.open();
                });
              },
            );
          },
          availableFilters: awesomePresetFiltersList,
        ),
      ),
              
              
            ],
          ),
        ),
      )
    ;
  }
}