import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/modules/profile/view/profile_preview.dart';
import 'package:prasada_political_portfolio/widgets/common/common_text.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_profile_stepper.dart';
import '../../../../widgets/common/common_button.dart';
import '../../../../widgets/common/common_input_field.dart';
import '../../../../widgets/common/common_reset_button.dart';
import '../../../../widgets/common/drawer.dart';
import '../../../../widgets/common/list_selector.dart';
import '../../../../widgets/common_appbar.dart';
import '../../../data/values/dimens.dart';
import '../../../routes/app_routes.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileEcStatus extends GetView<ProfileController> {
  ProfileEcStatus({Key? key}) : super(key: key);
  @override
  ProfileController controller  = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        drawer: HeaderDrawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            CustomProfileStepper(),
            const SizedBox(
              height: Dimens.gapX1,
            ),
            const Text(
              "Profile/ EC status & updates",
              style: AppStyles.tsBlackBold22,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "EC status & updates",
                  style: AppStyles.tsBlackRegular18,
                ),
                SizedBox(
                  width: Dimens.imageScaleX1,
                ),
                Text(
                  "(5 out of 5)",
                  style: AppStyles.tsBlackRegular14,
                ),
              ],
            ),
            ListSelector(
                child:Padding(
                  padding: const EdgeInsets.only(left:Dimens.paddingX4,right: Dimens.paddingX4,top:Dimens.paddingX4,bottom:Dimens.paddingX4),
                  child: CommonInputField(wrapper:controller.ecStatusDropDownText,hintText:"Type of Candidancy",suffixIcon:const Icon(Icons.arrow_drop_down),),
                ),
                onTap:(value) async{
                  controller.ecStatusDropDownText.controller.text= value;
                  },
                title:"Party Affiliation", data:const ['MLA','MP','MLC']),
            const SizedBox(height:Dimens.gapX1,),
            Padding(
              padding: const EdgeInsets.only(left:Dimens.paddingX4,right: Dimens.paddingX4),
              child: CommonInputField(wrapper:controller.ecStatusText,hintText:"Candidate EC Number",),
            ),
            const SizedBox(height:Dimens.paddingX4,),
            Text("Ec Documents",style:AppStyles.tsBlackBold20,),
            SizedBox(height: Dimens.scaleX2,),
            Container(
              width: Dimens.imageScaleX12,
              height: Dimens.imageScaleX12,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.secondaryColor)),
              child: IconButton(
                  icon: Icon(Icons.file_upload_outlined), onPressed: () {}
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(Dimens.imageScaleX3),
              child: CommonFilledButton(text:"Save & Next", onTap:(){
                Get.toNamed(Routes.PROFILE_PREVIEW_PAGE);
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.imageScaleX3),
              child: CommonResetButton(text:"Reset", onTap:(){
                controller.onResetEcPage();
              }),
            )
          ]
          ),
        )
    );
  }
}
