// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:prasada_political_portfolio/app/data/model/response/outside_voter_model.dart';
// import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
// import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/inside_outside_controller.dart';
// import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

// class CommonGridViewBuilder extends GetView<InsideOutsideController> {
//   String text;
//   String selectedValue = "";
//   int totalVotes = 0;
//   List<OutsideVoterModel>
//       marked; // Replace YourVoterModel with the actual model type
//   int totalMarked;
//   var scrollControllerAction;
//   bool isSelected;

//   CommonGridViewBuilder({
//     required this.text,
//     required this.selectedValue,
//     required this.totalVotes,
//     required this.scrollControllerAction,
//     required this.marked,
//     required this.totalMarked,
//     required this.isSelected,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: selectedValue == ""
//           ? Center(
//               child: Text(
//                 text,
//                 style: AppStyles.tsBlackBold22,
//               ),
//             )
//           : GridView.builder(
//               controller: scrollControllerAction,
//               physics: ScrollPhysics(),
//               shrinkWrap: true,
//               itemCount: isSelected
//                   ? totalMarked
//                   : controller.unselectedVoterNumbers.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisSpacing: 5,
//                   crossAxisSpacing: 5,
//                   crossAxisCount:
//                       (MediaQuery.of(context).size.width / 81).toInt()),
//               itemBuilder: (context, index) {
//                 String voterNumber = isSelected
//                     ? marked[index].voterSerialNumber.toString()
//                     : controller.unselectedVoterNumbers[index];

//                 return isSelected
//                     ? GestureDetector(
//                         onTap: () {
//                           controller.isOutsideUpdated(
//                               controller.selected.value,
//                               int.parse(
//                                   marked[index].voterSerialNumber.toString()),
//                               false);
//                           // controller.isOutsideUpdated(controller.selected.value,int.parse(selectedVoterNumbers[index] , false);
//                         },
//                         child: Card(
//                           color: Color.fromARGB(255, 227, 244, 227),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           elevation: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Stack(
//                                 alignment: Alignment.topCenter,
//                                 children: [
//                                   SvgPicture.asset(
//                                     "assets/images/poling.svg",
//                                     height: 35,
//                                   ),
//                                   Icon(
//                                     Icons.check_circle_rounded,
//                                     color: Colors.green,
//                                     size: 15,
//                                   ).paddingOnly(left: 40),
//                                 ],
//                               ).paddingOnly(
//                                 top: Dimens.gapX0_5,
//                               ),
//                               Text(
//                                 marked[index].voterSerialNumber.toString(),
//                                 style: AppStyles.tsBlackBold16,
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: (() {
//                           controller.isOutsideUpdated(
//                               controller.selected.value,
//                               int.parse(
//                                   controller.unselectedVoterNumbers[index]),
//                               true);
//                           print(controller.unselectedVoterNumbers[index]);
//                         }),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           elevation: 4,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               SvgPicture.asset(
//                                 "assets/images/poling.svg",
//                                 height: 35,
//                               ),
//                               Text(
//                                 voterNumber,
//                                 style: AppStyles.tsBlackBold14,
//                               ),
//                             ],
//                           ).paddingOnly(
//                             top: Dimens.gapX0_5,
//                           ),
//                         ),
//                       );
//               },
//             ).paddingOnly(left: Dimens.gapX1, right: Dimens.gapX1),
//     );
//   }
// }
