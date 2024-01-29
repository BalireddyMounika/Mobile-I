import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/PollingStationDownloadModel.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_repository.dart';
import 'package:prasada_political_portfolio/utils/helper/exception_handler.dart';

class PollingStationRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> updateVote(
      {required String stationUrl,
      required dynamic requestData,
      required String stationName,
      required String token,
      required String id}) async {
    final response = await controller.put(
        token: token,
        path: '${URLs.baseURL}$stationUrl$stationName/$id/',
        data: requestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  // to get all the get data
  Future<RepoResponse<GenericResponse>> getResponseData({
    required String url,
    required String stationName,
    required String token,
  }) async {
    final response =
        await controller.get(path: "$url$stationName/", token: token);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getPaginationResponseData(
      {required String url,
      required String stationName,
      required String page,
      required String token,
      required String perPage}) async {
    final response = await controller.get(
        path: "$url$stationName/$page/$perPage", token: token);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> downloadStationData({
    required PollingStationDownloadModel data,
    required String token,
  }) async {
    final response = await controller.post(
        path: URLs.pollingStationDownload, token: token, data: data.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
