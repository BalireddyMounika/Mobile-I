import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/network/network_requester.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';

class HomeController extends GetxController {
  NetworkRequester networkRequester = NetworkRequester();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    dashboard();
    super.onInit();
  }

  var now_sender = DateTime.now();

  List image = [];

  dashboard() async {
    String url = URLs.baseURL + '/metabase/';
    print("--------------------------url");
    var response = await networkRequester.get(path: url);
    var x = jsonDecode(response);
    image.add(x['Result']['total voters']);
    image.add(x['Result']['village voters']);
    image.add(x['Result']['madugula voters by lastname']);
    image.add(x['Result']['village voters by lastname']);
    image.add(x['Result']["Weekly Campaign Data Update"]);
    image.add(x['Result']['Caste Bifurcation']);
    image.add(x['Result']['Party Inclination']);
    image.add(x['Result']['Total_Mandals_in_madugula']);
    image.add(x['Result']['Cheedikada_Mandal']);
    image.add(x['Result']['Devarapalli_Mandal']);
    image.add(x['Result']['K.kotapadu_Mandal']);
    image.add(x['Result']['Madugula_Mandal']);
    image.add(x['Result']['Dissidents Party Wise']);
    image.add(x['Result']['Non Local Resident']);
    image.add(x['Result']['Local Resident']);
    image.add(x['Result']);
    print("----------- image ------------ ${image}");
  }
}
