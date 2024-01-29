import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/model/response/VoterResponse.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';

class VoterCard extends StatelessWidget {
  final VoterResponse voterResponse;
  final bool? isSelected;
  const VoterCard({Key? key, required this.voterResponse, this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
              color: isSelected ?? false
                  ? AppColors.secondaryColor
                  : AppColors.whiteColor),
          borderRadius: BorderRadius.circular(Dimens.gapX1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.gapX1, vertical: Dimens.gapX1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimens.gapX1))),
            ),
            Text(
              voterResponse.voterId ?? 'NA',
              style: AppStyles.tsBaseRegular14,
            ),
            SizedBox(height: Dimens.gapX1),
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(
                  width: Dimens.gapX1,
                ),
                Expanded(
                  child: Text(
                    voterResponse.name ?? 'Na',
                    maxLines: 2,
                    style: AppStyles.tsBlackRegular16,
                  ),
                )
              ],
            ),
            SizedBox(height: Dimens.gapX0_5),
            Row(
              children: [
                const Icon(Icons.family_restroom_outlined),
                const SizedBox(
                  width: Dimens.gapX1,
                ),
                Text(
                  voterResponse.guardian ?? 'NA',
                  style: AppStyles.tsBlackRegular12,
                ),
              ],
            ),
            SizedBox(height: Dimens.gapX0_5),
            Row(
              children: [
                const Icon(Icons.cake),
                const SizedBox(
                  width: Dimens.gapX1,
                ),
                Text(
                  voterResponse.age ?? 'NA',
                  style: AppStyles.tsBlackRegular12,
                ),
              ],
            ),
            SizedBox(height: Dimens.gapX0_5),
            Row(
              children: [
                const Icon(Icons.home_filled),
                SizedBox(
                  width: 10,
                ),
                Text(
                  voterResponse.home ?? '',
                  style: AppStyles.tsBlackRegular12,
                ),
              ],
            ),
            SizedBox(height: Dimens.gapX0_5),
            Row(
              children: [
                const Icon(Icons.male),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  voterResponse.gender ?? 'Na',
                  style: AppStyles.tsBlackRegular12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
