import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/BulkCampaignUpdateRequest.dart';
import 'package:prasada_political_portfolio/app/data/repository/analytic_repository.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';
import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

class BulkCardCampaignController extends GetxController {
  AnalyticRepository repository = AnalyticRepository();

  RxBool interestedToJoinParty = false.obs;
  RxBool isDissidentChecked = false.obs;
  RxBool isVoted = false.obs;
  RxBool isContactMoodTeamContacted = false.obs;

  int userid = 0;
  List<int> ivinIds = [];

  TextFieldWrapper caste = TextFieldWrapper();
  TextFieldWrapper professionNamesWrapper = TextFieldWrapper();
  TextFieldWrapper contactNumberWrapper = TextFieldWrapper();
  TextFieldWrapper partyInclinationWrapper = TextFieldWrapper();
  TextFieldWrapper interestedToJoinPartyWrapper = TextFieldWrapper();
  TextFieldWrapper interestedToJoinPartyComments = TextFieldWrapper();
  TextFieldWrapper dissident = TextFieldWrapper();
  TextFieldWrapper dissidentCommentsWrapper = TextFieldWrapper();
  TextFieldWrapper contactModeWrapper = TextFieldWrapper();
  TextFieldWrapper contactModeContactByWrapper = TextFieldWrapper();
  TextFieldWrapper contactModeCommentsWrapper = TextFieldWrapper();
  TextFieldWrapper lastname = TextFieldWrapper();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      ivinIds = Get.arguments;
    }
  }

  fillUserDetails(var response) {}

  Future<void> updateCampaignDetails() async {
    BulkCampaignUpdateRequest requestData = BulkCampaignUpdateRequest(
        profession: professionNamesWrapper.controller.text,
        partyInclination: partyInclinationWrapper.controller.text,
        otherparty: '',
        contactNumber: contactNumberWrapper.controller.text,
        contactMode: contactModeWrapper.controller.text,
        contactedBy: contactModeContactByWrapper.controller.text,
        commentsForTeamContacted: contactModeCommentsWrapper.controller.text,
        isVoted: isVoted.value,
        dissident: isDissidentChecked.value,
        postelBallot: false,
        informedPersonForDissident: dissident.controller.text,
        commentsForDissident: dissidentCommentsWrapper.controller.text,
        caste: caste.controller.text,
        interestToJoinParty: interestedToJoinParty.value,
        informedPerson: interestedToJoinPartyWrapper.controller.text,
        commentsForJoinParty: interestedToJoinPartyComments.controller.text);

    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response =
        await repository.updateBulkCampaignDetails(
            requestData: requestData,
            ivinId: ivinIds,
            userId: AppStorage.getUser().id ?? 0,
            token: AppStorage.getUser().bearerToken ?? '');
    LoadingUtils.hideLoader();
    if (response.data?.status == 200 || response.data?.status == 201) {
      Get.back();
      AppUtils.showSnackBar('Campaign Updated');
    } else {
      AppUtils.showSnackBar(response.error?.message ??
          response.data?.message ??
          'Somethings went wrong');
    }
  }

  void resetPage() {
    caste.controller.text = "";
    professionNamesWrapper.controller.text = "";
    contactNumberWrapper.controller.text = "";
    partyInclinationWrapper.controller.text = "";
    interestedToJoinParty.value = false;
    interestedToJoinPartyWrapper.controller.text = "";
    interestedToJoinPartyComments.controller.text = "";
    isDissidentChecked.value = false;
    dissident.controller.text = "";
    dissidentCommentsWrapper.controller.text = "";
    isVoted.value = false;
    contactModeWrapper.controller.text = "";
    contactModeContactByWrapper.controller.text = "";
    contactModeCommentsWrapper.controller.text = "";
  }
}
