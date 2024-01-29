import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/widgets/common/custom_profile_stepper.dart';
import '../../../../utils/snackbar/snackbar.dart';
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
import '../controller/profile_controller.dart';

class profilePoliticalHistory extends GetView<ProfileController> {
  profilePoliticalHistory({Key? key}) : super(key: key);
  @override
  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: HeaderDrawer(),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            CustomProfileStepper(),
            const Padding(
              padding: EdgeInsets.only(top: Dimens.gapX1),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Profile / Political History",
                  style: AppStyles.tsBlackBold22,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Political History",
                  style: AppStyles.tsBlackRegular18,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "(3 out of 5)",
                  style: AppStyles.tsBlackRegular14,
                ),
              ],
            ),
            Container(
                height: Dimens.imageScaleX20,
                color: AppColors.whiteColor,
                margin:const EdgeInsets.all(Dimens.gapX2),
                child: Column(children: [
                  ListSelector(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: Dimens.paddingX4,
                            right: Dimens.paddingX4,
                            top: Dimens.paddingX4),
                        child: CommonInputField(
                          wrapper: controller.politicalHistoryDropDownText,
                          hintText: "Party Affiliation",
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                      onTap: (party) async{
                        controller.politicalHistoryDropDownText.controller.text=party;
                      },
                      title: "Party Affiliation",
                      data:controller.politicalPartyNamesList),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.paddingX4,
                      right: Dimens.paddingX4,
                    ),
                    child: CommonInputField(
                      wrapper: controller.politicalHistoryTitle,
                      hintText: "Type Your Title",
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.paddingX4,
                      right: Dimens.paddingX4,
                    ),
                    child: GestureDetector(
                      child: AbsorbPointer(
                        child: CommonInputField(
                          wrapper: controller.politicalHistoryFromDateText,
                          hintText: "From",
                          suffixIcon:const Icon(Icons.calendar_month),
                        ),
                      ),
                      onTap: (){
                        controller.choosePoliticalHistoryFromDate();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: Dimens.gapX2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.paddingX4,
                      right: Dimens.paddingX4,
                    ),
                    child: GestureDetector(
                      child: AbsorbPointer(
                        child: CommonInputField(
                          wrapper: controller.politicalHistoryToDateText,
                          suffixIcon:const Icon(Icons.calendar_month),
                          hintText: "To",
                        ),
                      ),
                      onTap:(){
                        controller.choosePoliticalHistoryToDate();
                      },
                    ),
                  ),
                ])),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Container(
                  margin: const EdgeInsets.only(right:Dimens.imageScaleX3),
                  width:Dimens.imageScaleX3,
                  height: Dimens.imageScaleX3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:AppColors.secondaryColor,
                      border: Border.all(color: AppColors.secondaryColor)),
                  child: const Icon(
                    Icons.add,
                    size: Dimens.imageScaleX2,
                    color: AppColors.whiteColor,
                  ),
                ),
                onTap: () {
                  controller.politicalHistoryDropDownText.controller.text.isEmpty
                      ? Error_message('Error','Enter Any Field'):
                  controller.onAddHistoryList(
                      controller.politicalHistoryDropDownText.controller.text, controller.politicalHistoryTitle.controller.text,
                      controller.politicalHistoryFromDateText.controller.text,controller.politicalHistoryToDateText.controller.text);
                  controller.politicalHistoryDropDownText.controller.clear();
                  controller.politicalHistoryTitle.controller.clear();
                  controller.politicalHistoryFromDateText.controller.clear();
                  controller.politicalHistoryToDateText.controller.clear();
                },
              ),
            ),
            Obx(() => controller.HistoryListItems.isEmpty ?const Text(''):
            Column(
              children:List.generate(controller.HistoryListItems.length, (index){
                return Column(
                  children: [
                    Padding(
                      padding:const EdgeInsets.only(top:Dimens.scaleX3,left:Dimens.scaleX3,right:Dimens.scaleX3),
                      child: Container(
                          height:Dimens.imageScaleX16,
                          width: Dimens.screenWidth,
                          color:AppColors.whiteColor,
                          child:Column(
                              children: [
                                InkWell(child: const Align(alignment:Alignment(1.02, -1.15),child: Icon(Icons.cancel,size:Dimens.imageScaleX2,)),
                                  onTap: (){
                                    print("deleted $index");
                                    controller.onRemoveHistoryList(index);
                                  },),
                                Text(controller.HistoryPartyNames[index],style:AppStyles.tsSecondaryRegular700,),
                                Text(controller.HistoryPersonDesignation[index],style:AppStyles.tsSecondaryColorRegular14,),
                                Padding(
                                  padding: const EdgeInsets.all(Dimens.scaleX3),
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_today,size:Dimens.imageScaleX2,),
                                          Text(controller.HistoryFromDate[index],style:AppStyles.tsSecondaryColorRegular14,),
                                        ],
                                      ),
                                      const Text("to",style: AppStyles.tsSecondaryColorRegular14,),
                                      Row(
                                        children: [
                                          const Icon(Icons.calendar_today,size:Dimens.imageScaleX2,),
                                          Text(controller.HistoryToDate[index],style:AppStyles.tsSecondaryColorRegular14,),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]
                          )
                      ),
                    ),
                  ],
                );
              }),
            )
            ),

            Padding(
              padding: const EdgeInsets.all(Dimens.imageScaleX3),
              child: CommonFilledButton(text:"Save & Next", onTap:(){
                Get.toNamed(Routes.PROFILE_SOCIAL_MEDIA);
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.imageScaleX3),
              child: CommonResetButton(text:"Reset", onTap:(){
                controller.onResetPoliticalPage();
              }),
            )
          ])),
    );
  }
}
