import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/values/dimens.dart';
import '../../../themes/app_styles.dart';

class EventLinkListView extends StatelessWidget {

  final int count;
  final List textLinkList;
  final icon;

  const EventLinkListView({
    Key? key,
    required this.count,
    required this.textLinkList,
    this.icon
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
            child: Text(
              textLinkList[index],style: const TextStyle(fontSize:Dimens.imageScaleX2,color:Colors.blue,decoration: TextDecoration.underline),
            ),
          ),
          trailing:InkWell(
            child: icon,
            onTap:(){
              textLinkList.removeAt(index);
            },
          ),
        );
      },growable: true),
    );
  }
}