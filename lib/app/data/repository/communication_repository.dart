import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_repository.dart';
import 'package:prasada_political_portfolio/utils/helper/exception_handler.dart';

import '../model/resuest/CommunicationPostModel.dart';

class CommunicationRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> getManda(
      {required String constituencyName, required String token}) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.getMandalByConstituency}/$constituencyName/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getPolingStation(
      {required String mandalName, required String token}) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.getAllPollingStationNameAndNum}/$mandalName/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getAllSectionNameAndNumber(
      {required String sectionNameAndNumber, required String token}) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.getAllSectionNumberAndName}/$sectionNameAndNumber/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getCommunicationFilteredVoterData(
      {required String constituency,
      required String gender,
      required String home,
      required String lastName,
      required String mandal,
      required String name,
      required String pollingStationName,
      required String sectionName,
      required String voterId,
      required String token}) async {
    final response = await controller.get(
        token: token,
        path:
            '${URLs.communication_search}$constituency/$pollingStationName/$gender/$name/$sectionName/$lastName/$home/$mandal/$voterId/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getPartyNames(
      {required String token}) async {
    final response =
        await controller.get(token: token, path: URLs.getAllPartyNames);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getHabitationNames(
      {required String token}) async {
    final response = await controller.get(token: token, path: URLs.habitation);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getSchemeNames(
      {required String token}) async {
    final response = await controller.get(token: token, path: URLs.scheme);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getCommunicationModuleFilter(
      {required String ivinIds,
      required String caste,
      required String contactNumber,
      required String partyInclinationId,
      required String profession,
      required String contactMode,
      required String nonLocalAddress,
      required String dissident,
      required String interestedToJoinParty,
      required String physicallyChallenged,
      required String habitation,
      required String fromAge,
      required String toAge,
      required String schemes,
      required String token}) async {
    final response = await controller.get(
        token: token,
        path:
            '${URLs.communicationFilter}$ivinIds/$caste/$contactNumber/$partyInclinationId/$profession/$contactMode/$nonLocalAddress/$dissident/$interestedToJoinParty/$physicallyChallenged/$habitation/$fromAge/$toAge/$schemes/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> communicationPost(
      {required CommunicationRequestModel requestModel}) async {
    final response = await controller.post(
      path: URLs.communicationModulePost,
      // data: requestModel.toJson(),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
