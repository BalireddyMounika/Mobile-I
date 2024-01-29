// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/widgets/voder_card.dart';
// import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
// import 'package:prasada_political_portfolio/widgets/common/drawer.dart';
// import 'package:prasada_political_portfolio/widgets/common_appbar.dart';
//
// import '../../../data/values/dimens.dart';
// import '../../../routes/app_routes.dart';
// import '../../../themes/app_colors.dart';
// import '../controllers/filter_voter_view_controller.dart';
//
// class Filter_voter_view extends StatelessWidget {
//   Filter_voter_view({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: HeaderDrawer(),
//       appBar: CustomAppBar(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: AppColors.baseColor,
//         foregroundColor: AppColors.whiteColor,
//         onPressed: () {
//           Get.toNamed(Routes.BULK_EDIT);
//         },
//         label: const Text(
//           "Bulk Edit",
//           style: AppStyles.tswhiteColorRegular16,
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: Dimens.gapX1),
//             child: Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                       Get.toNamed(Routes.ADVANCE_DATA_ANALYTICS_VOTER_VIEW);
//                     },
//                     icon: const Icon(Icons.arrow_back_ios_new)),
//                 const Expanded(
//                     child: Center(
//                   child: Text(
//                     "Results",
//                     style: AppStyles.tsSecondaryRegular700,
//                   ),
//                 ))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: Dimens.gapX2,
//             width: Dimens.screenWidthX14,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   shape: const RoundedRectangleBorder(
//                       side: BorderSide(color: AppColors.secondaryColor)),
//                   backgroundColor: AppColors.snackbarColor),
//               child: Row(
//                 children: const [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         right: Dimens.gapX1, left: Dimens.gapX10),
//                     child: Text(
//                       'Fliter By',
//                       style: AppStyles.tsBlackRegular14,
//                     ),
//                   ),
//                   Icon(
//                     Icons.filter_list,
//                     color: AppColors.secondaryColor,
//                   ),
//                 ],
//               ),
//               onPressed: () {
//                 Get.toNamed(Routes.FILTER_VIEW);
//               },
//             ),
//           ),
//           Expanded(child: VoterCard())
//         ],
//       ),
//     );
//   }
// }
//
