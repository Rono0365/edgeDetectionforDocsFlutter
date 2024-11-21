import "package:edge3/accounts/settings.dart";
import "package:flutter/material.dart";
import "package:edge3/analyzer/docanalyzer.dart";
class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return DocumentScannerView();
  }
}