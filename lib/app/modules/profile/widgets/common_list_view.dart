import 'package:flutter/material.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/themes/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';


class CommonListViewSocialMedia extends StatelessWidget {

  final int count;
  final List textLinkList;
  final List textDescList;

  const CommonListViewSocialMedia({
    Key? key,
    required this.textDescList,
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
            child: Text(
                textLinkList[index],style: const TextStyle(fontSize:Dimens.imageScaleX2,color:Colors.blue,decoration: TextDecoration.underline)),
          ),
          subtitle: Text(
              textDescList[index]),
          trailing: IconButton(
              onPressed:(){
                textLinkList.removeAt(index);
                textDescList.removeAt(index);
              },
              icon: Icon(Icons.cancel)),
        );
      },growable: true),
    );
  }
}

class CommonListViewCandidateInfo extends StatelessWidget {
  final int count;
  final List textLinkList;

  const CommonListViewCandidateInfo({
    Key? key,
    required this.count,
    required this.textLinkList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:List.generate(count, (index){
        return ListTile(
            title:Text(
                textLinkList[index],style:AppStyles.tsBlackMedium14),
            trailing: IconButton(
                onPressed:(){
                  textLinkList.removeAt(index);
                  },
                icon: Icon(Icons.cancel)),
        );
      },growable: true),
    );
  }
}

