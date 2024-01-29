import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/profile_request.dart';
import 'package:prasada_political_portfolio/app/data/values/env.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_repository.dart';
import '../../../utils/helper/exception_handler.dart';
import '../model/dto/RepoResponse.dart';

class ProfileRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> getPartyNames() async {
    final response =
        await controller.get(token: Env.token, path: URLs.getAllPartyNames);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> postProfileAboutAllData(
      CreateProfileRequestModel createRequestData) async {
    final response = await controller.post(
        path: URLs.postAllProfileAboutData, data: createRequestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> postProfilePoliticalData(
      CreatePoliticalRequestModel createRequestData) async {
    final response = await controller.post(
        path: URLs.postAllProfilePoliticalData,
        data: createRequestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
