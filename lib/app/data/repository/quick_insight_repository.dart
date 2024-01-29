import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/SaveInsightsRequest.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_repository.dart';
import 'package:prasada_political_portfolio/utils/helper/exception_handler.dart';

import '../model/resuest/search_quick_analytics_request.dart';

class QuickInsightRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> getAllQuickInsights(
      {required String page,
      required String pageSize,
      required String token}) async {
    final response = await controller.get(
        token: token, path: "${URLs.getAllQuickInsightsData}$page/$pageSize/");
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getQuickSearchAnalyticsData(
      {required String token,
      required SearchQuickAnalyticsRequest requestData}) async {
    final response = await controller.post(
        token: token,
        path: URLs.quickinsightsSearchDataAnalyticsForData,
        data: requestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> saveFilterQuickInsight(
      {required String token, required SaveInsightsRequest requestData}) async {
    final response = await controller.post(
        token: token,
        path: URLs.saveSearchInsights,
        data: requestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> updateQuickInsights(
      {required String token,
      required SaveInsightsRequest requestData,
      required int id}) async {
    final response = await controller.put(
        token: token,
        path: '${URLs.updateInsights}$id/',
        data: requestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
