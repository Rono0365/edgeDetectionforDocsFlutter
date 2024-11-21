import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_mlkit_document_scanner/google_mlkit_document_scanner.dart';
import 'package:path/path.dart' as path;
import "package:google_fonts/google_fonts.dart";
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import "package:ionicons/ionicons.dart";

class DocumentScannerView extends StatefulWidget {
  @override
  State<DocumentScannerView> createState() => _DocumentScannerViewState();
}

class _DocumentScannerViewState extends State<DocumentScannerView> {
  DocumentScanner? _documentScanner;
  DocumentScanningResult? _result;

  @override
  void dispose() {
    _documentScanner?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor:Colors.white,
      
      body: Column(
        //alignment: WrapAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListTile(title: Text("Tap to Scan", style: GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                )),),
           ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: InkWell(
                                onTap: () {
                                  startScan(DocumentFormat.pdf);
                                },
                                child: Container(
                                  height: 180,
                                  width:
                                      MediaQuery.of(context).size.width * .84,
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const ListTile(
                                          title: Row(
                                            children: [
                                              Icon(
                                                Icons.document_scanner,
                                                size: 30,
                                                color: Colors.deepOrange,
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("Scan Pdf\n",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                              )),
                                          subtitle: Row(
                                            children: [
                                            SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
           ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  startScan(DocumentFormat.jpeg);
                                },
                                child: Container(
                                  height: 180,
                                  width:
                                      MediaQuery.of(context).size.width * .84,
                                  decoration: BoxDecoration(
                                      color: Colors.cyan.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const ListTile(
                                          title: Row(
                                            children: [
                                              Icon(
                                                Icons.picture_in_picture_alt,
                                                size: 30,
                                                color: Colors.deepOrange,
                                              ),
                                            ],
                                          ),
                                        ),
                                        ListTile(
                                          title: Text("Scan JPEG\n",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                              )),
                                          subtitle: Row(
                                            children: [
                                            SizedBox()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
        /*  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
            //  SizedBox(width: 118),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.black),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () => startScan(DocumentFormat.pdf),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: const Text(
                    'Scan PDF',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(Colors.black),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () => startScan(DocumentFormat.jpeg),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: const Text(
                    'Scan JPEG',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          if (_result?.pdf != null) ...[
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 8, right: 8, left: 8),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('PDF Document:')),
            ),
            SizedBox(
              height: 300,
              child: PDFView(
                filePath: _result!.pdf!.uri,
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: false,
                pageFling: false,
              ),
            ),
          ],
          if (_result?.images.isNotEmpty == true) ...[
            Padding(
              padding: const EdgeInsets.only(
                  top: 16, bottom: 8, right: 8, left: 8),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Images [0]:')),
            ),
            SizedBox(
                height: 400, child: Image.file(File(_result!.images.first))),
          ],*/
        ],
      ),
    );
  }

  void startScan(DocumentFormat format) async {
      _result = null;
      
      _documentScanner?.close();
      _documentScanner = DocumentScanner(
        options: DocumentScannerOptions(
          documentFormat: DocumentFormat.jpeg,
          mode: ScannerMode.full,
          isGalleryImport: true,
          pageLimit: 1,
        ),
      );
      _result = await _documentScanner?.scanDocument();
      print('result: $_result');
      
      // Save PDF outside of setState
      if (_result != null ) {
        print('result: $_result');
        await _savePdfFile(_result);
      }
      
      setState(() {
        // Any UI updates you want to make after scanning
      });

      print('Error: $_result');
    
  }

  Future<void> _savePdfFile(dynamic result) async {
    try {
      // Get the application documents directory
      final directory = await getApplicationDocumentsDirectory();
      
      // Create a unique filename
      final filename = 'document_${DateTime.now().millisecondsSinceEpoch}.pdf';
      
      // Construct the full file path
      final filePath = path.join(directory.path, filename);
      
      // Write the PDF bytes to the file
      await File(filePath);//google_mlkit_document_scanner
      
      print('PDF saved successfully at $filePath');
    } catch (e) {
      print('Error saving PDF: $e');

    }
  }
}