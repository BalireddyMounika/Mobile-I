import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/routes/app_routes.dart';
import 'package:prasada_political_portfolio/app_bindings.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
        if (Get.isOverlaysOpen) Get.back();
      },
      child: GetMaterialApp(
        initialRoute: Routes.SPLASH,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
        initialBinding: AppBinding(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}
