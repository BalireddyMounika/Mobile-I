import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:webviewx/webviewx.dart';
import 'package:get/get.dart';
import '../../app/modules/home/controllers/home_controller.dart';

class MetabaseWebView extends StatelessWidget {
  final int index;

  MetabaseWebView({Key? key, required this.index}) : super(key: key);

  HomeController controller = Get.find();
  late WebViewXController webviewController;

  @override
  Widget build(BuildContext context) {
    return WebViewX(
      ignoreAllGestures: true,
      initialContent: controller.image[index].toString(),
      initialSourceType: SourceType.url,
      onWebViewCreated: (controller) => webviewController = controller,
      width: Dimens.screenWidth,
      height: Dimens.imageScaleX24,
    );
  }
}
