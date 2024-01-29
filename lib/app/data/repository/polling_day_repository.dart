import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_repository.dart';
import 'package:prasada_political_portfolio/utils/helper/exception_handler.dart';

class PollingStationRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> getPollingStations(
      {required String userID}) async {
    final response = await controller.get(
        token: URLs.token, path: "${URLs.pollingStations}$userID/");
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  // to get inside outside marked votes
  Future<RepoResponse<GenericResponse>> getPollingStationData(
      {required String stationURL, required String stationName}) async {
    final response = await controller.get(
        token: URLs.token, path: "$stationURL$stationName/");
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> updateIdAddress({
    required String stationName,
    required dynamic requestData,
  }) async {
    final response = await controller.put(
        token: URLs.token,
        path: "${URLs.deviceIdAddress}$stationName/",
        data: requestData.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> updateVote(
      {required String stationUrl,
      required dynamic requestData,
      required String stationName,
      required int id}) async {
    final response = await controller.put(
        token: URLs.token,
        path: '${URLs.baseURL}$stationUrl$stationName/$id/',
        data: requestData.toJson());
    print(id);
    print(stationName);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  // to get all the get data
  Future<RepoResponse<GenericResponse>> getResponseData({
    required String url,
    required String stationName,
  }) async {
    final response =
        await controller.get(path: "$url$stationName/", token: URLs.token);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
