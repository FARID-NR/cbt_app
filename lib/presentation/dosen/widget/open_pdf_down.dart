import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewers extends StatefulWidget {
  final String pdfPath; // Path to your PDF file

  const PDFViewers({Key? key, required this.pdfPath}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PDFViewersState createState() => _PDFViewersState();
}

class _PDFViewersState extends State<PDFViewers> {
  late PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: widget.pdfPath,
        onViewCreated: (PDFViewController pdfViewController) {
          setState(() {
            _pdfViewController = pdfViewController;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: Scroll to a specific page (page number 2 in this case)
          _pdfViewController.setPage(2);
        },
        child: const Icon(Icons.arrow_downward),
      ),
    );
  }
}
