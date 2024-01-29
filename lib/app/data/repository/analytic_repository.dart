import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/BulkCampaignUpdateRequest.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/update_voter_data_request.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_repository.dart';
import 'package:prasada_political_portfolio/utils/helper/exception_handler.dart';

class AnalyticRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> getManda(
      {required String constituencyName, required String token}) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.getMandalByConstituency}/$constituencyName');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getDistrict(
      {required String stateName, required String token}) async {
    final response = await controller.get(
        token: token, path: '${URLs.getAllDistrictName}/$stateName');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getConstituency(
      {required String districtName, required String token}) async {
    final response = await controller.get(
        token: token, path: '${URLs.getAllDistrictConstituency}/$districtName');
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

  Future<RepoResponse<GenericResponse>> getVoterRefImage(
      {required String folderName,
      required String imageName,
      required String token}) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.getImageUpload}/$imageName.webp/$folderName');
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

  Future<RepoResponse<GenericResponse>> getPolingStationLocation(
      {required String polingStationNumber, required String token}) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.getPolingStationLocation}/$polingStationNumber/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getPolingStationNumber(
      {required String polingStationName, required String token}) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.getAllPolingStationNumber}/$polingStationName/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getFilteredVoterData({
    required String constituency,
    required String gender,
    required String home,
    required String lastName,
    required String mandal,
    required String name,
    required String pollingStationName,
    required String sectionName,
    required String voterId,
    // required String page,
    // required String perPage,
    required String cast,
    required String contactNumber,
    // required String partyInclination,
    required String token,
  }) async {
    final response = await controller.get(
        token: token,
        path:
            '${URLs.getDataAnalyticsBysearchfilter}/$constituency/$pollingStationName/$gender/$name/$sectionName/$lastName/$home/$mandal/$cast/$contactNumber/$voterId/');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getFamilyVoterData({
    required String constituency,
    required String gender,
    required String home,
    required String lastName,
    required String mandal,
    required String name,
    required String guardian,
    required String pollingStationName,
    required String sectionName,
    required String voterId,
    required String cast,
    required String contactNumber,
    required String token,
  }) async {
    final response = await controller.get(
        token: token,
        path:
            '${URLs.botV2DataAnalyticsGetByFields}/$constituency/$pollingStationName/$gender/$name/$sectionName/$lastName/$home/$mandal/$cast/$contactNumber/$voterId/$guardian');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getVoterProof({
    required String folderName,
    required String imageName,
    required String token,
  }) async {
    final response = await controller.get(
        token: token,
        path: '${URLs.imageuploadGetImageByName}/$imageName/$folderName');
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> updateVoterData(
      {required UpdateVoterDataRequest requestData,
      required int ivinId,
      required String token}) async {
    final response = await controller.put(
        path: '${URLs.updateVoterDataById}/$ivinId',
        token: token,
        data: requestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> updateBulkCampaignDetails(
      {required BulkCampaignUpdateRequest requestData,
      required List<int> ivinId,
      required int userId,
      required String token}) async {
    final response = await controller.put(
        path: '${URLs.updateVoterDataById}/$ivinId',
        token: token,
        data: requestData.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future<RepoResponse<GenericResponse>> getVoterImagerImage({
    required String image,
    required String downloadPath,
    required String token,
  }) async {
    final response =
        await controller.download(url: image, savePath: downloadPath);
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }

  Future downloadAttachmentFile({required String url}) async {
    return await controller.downloadFile(
      path: url,
    );
  }
}
