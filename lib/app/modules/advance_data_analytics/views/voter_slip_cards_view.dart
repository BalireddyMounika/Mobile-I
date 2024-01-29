// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:http/http.dart' as http;
// import 'dart:typed_data';
//
// class VoterSlipsCardsView extends StatefulWidget {
//   final String pdfURL; // The URL to the PDF file
//
//   VoterSlipsCardsView({required this.pdfURL});
//
//   @override
//   _PDFViewerFromURLState createState() => _PDFViewerFromURLState();
// }
//
// class _PDFViewerFromURLState extends State<VoterSlipsCardsView> {
//   int pages = 0;
//   late PDFViewController _pdfViewController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer from URL'),
//       ),
//       body: PDFView(
//         onViewCreated: (PDFViewController pdfViewController) {
//           _pdfViewController = pdfViewController;
//           _loadPDF();
//         },
//         onPageChanged: (int? page, int? total) {
//           setState(() {
//             pages = total ?? 0;
//           });
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//             'Page ${_pdfViewController.getCurrentPage()} of $pages',
//             style: TextStyle(fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _loadPDF() async {
//     final response = await http.get(Uri.parse(widget.pdfURL));
//     final Uint8List data = response.bodyBytes;
//
//     _pdfViewController.loadDocument(PdfDocument.openData(data));
//   }
// }
