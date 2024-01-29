import 'FinalIvinDataAnalytics.dart';

class QuickInsightSearchResult {
  QuickInsightSearchResult({
    this.count,
    this.finalIvinDataAnalytics,
    this.masterIvinids,
    this.pagecount,
  });

  QuickInsightSearchResult.fromJson(dynamic json) {
    count = json['Count'];
    if (json['final_ivin_data_analytics'] != null) {
      finalIvinDataAnalytics = [];
      json['final_ivin_data_analytics'].forEach((v) {
        finalIvinDataAnalytics?.add(FinalIvinDataAnalytics.fromJson(v));
      });
    }
    masterIvinids = json['Master_Ivinids'];
    pagecount = json['pagecount'];
  }
  int? count;
  List<FinalIvinDataAnalytics>? finalIvinDataAnalytics;
  List<dynamic>? masterIvinids;
  int? pagecount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Count'] = count;
    if (finalIvinDataAnalytics != null) {
      map['final_ivin_data_analytics'] =
          finalIvinDataAnalytics?.map((v) => v.toJson()).toList();
    }
    map['Master_Ivinids'] = masterIvinids;
    map['pagecount'] = pagecount;
    return map;
  }
}
