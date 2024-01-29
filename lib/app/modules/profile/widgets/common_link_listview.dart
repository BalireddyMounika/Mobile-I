import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../themes/app_colors.dart';


class CommonProfileLinkListView extends StatelessWidget {

  final int count;
  final List textLinkList;

  const CommonProfileLinkListView({
    Key? key,
    required this.count,
    required this.textLinkList,
  }) : super(key: key);

  Future<void> _launchLinkURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:List.generate(count, (index){
        return ListTile(
          title: GestureDetector(
            onTap: (){
              _launchLinkURL(Uri.parse(textLinkList[index].toString()));
            },
            child: Center(
              child: Text(
                  textLinkList[index],style: TextStyle(fontSize:Dimens.imageScaleX2,color:Colors.blue,decoration: TextDecoration.underline)),
            ),
          ),
        );
      }),
    );
  }
}

class CommonProfileTextListView extends StatelessWidget {

  final int count;
  final List textLinkList;

  const CommonProfileTextListView({
    Key? key,
    required this.count,
    required this.textLinkList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:List.generate(count, (index){
        return ListTile(
          title: Center(
            child: Text(
                textLinkList[index],style:AppStyles.tsBlackMedium14),
          ),
        );
      }),
    );
  }
}

class CommonPreviewMediaListView extends StatelessWidget {
  final int count;
  final List textLinkList;
  final List textDescList;
  final FaIcon icon;
  const CommonPreviewMediaListView({
    Key? key,
    required this.count,
    required this.textLinkList,
    required this.textDescList,
    required this.icon,
  }) : super(key: key);

  Future<void> _launchVideoURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
        height: Dimens.imageScaleX14,
        width: Dimens.imageScaleX20,
        decoration: BoxDecoration(
        color: AppColors.snackbarColor,
        borderRadius: BorderRadius.circular(Dimens.imageScaleX1),
    border: Border.all(color: AppColors.greyColor)
    ),
    child: ListView.builder(
        itemCount:count,
        itemBuilder:(BuildContext context,index) {
          return ListTile(
              title: GestureDetector(
                onTap: () {
                  _launchVideoURL(
                      Uri.parse(textLinkList[index]));
                },
                child: Text(textDescList[index], style: const TextStyle(
                    fontSize: Dimens.imageScaleX2,
                    color: Colors.blue,
                    decoration: TextDecoration.underline),),
              ),
              leading: icon
          );
        }
    )
    )
    );
  }
}

