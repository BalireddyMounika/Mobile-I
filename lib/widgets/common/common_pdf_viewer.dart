import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/widgets/common_appbar.dart';
import 'package:printing/printing.dart';

import '../../utils/app_utils.dart';

class CommonPdfViewer extends StatelessWidget {
  final Uint8List? file;
  final String? fileName;
  final bool isAppBarVisible;
  final bool isWhatsAppShare;
  final bool isEmailShare;
  final String number;
  final String mailId;

  const CommonPdfViewer({
    Key? key,
    this.file,
    this.fileName,
    this.isAppBarVisible = true,
    this.isWhatsAppShare = false,
    this.isEmailShare = false,
    this.number = '',
    this.mailId = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBarVisible ? CustomAppBar() : null,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Theme(
          data: ThemeData(
            primaryColor: AppColors.whiteColor,
          ),
          child: PdfPreview(
            build: (format) => file!,
            useActions: true,
            allowPrinting: isWhatsAppShare ? false : true,
            allowSharing: isEmailShare ? false : true,
            canChangeOrientation: false,
            canChangePageFormat: false,
            canDebug: false,
            pdfFileName: "$fileName.pdf",
            shouldRepaint: true,
            loadingWidget: CircularProgressIndicator(),
            pdfPreviewPageDecoration:
                BoxDecoration(color: AppColors.whiteColor),
            onError: (context, object) => Text("Invalid PDF"),
            previewPageMargin: const EdgeInsets.all(8),
            actions: [
              PdfPreviewAction(
                icon: Icon(FontAwesomeIcons.download, size: 20),
                onPressed: (context, fn, format) =>
                    savePDF(file!, fileName: fileName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void savePDF(Uint8List bytes, {String? fileName = "Document"}) async {
    File.fromRawPath(bytes);
    Directory? appDocumentsDirectory = await getExternalStorageDirectory();
    String appPath = appDocumentsDirectory?.path ?? "";
    final file = await File('$appPath/$fileName.pdf').create();
    file.writeAsBytesSync(bytes);
    try {
      await OpenFile.open(file.path);
    } catch (e) {
      log('PDF Downlaod Error : ${e.toString()}');
      AppUtils.showSnackBar('something went wrong');
    }
  }
}
