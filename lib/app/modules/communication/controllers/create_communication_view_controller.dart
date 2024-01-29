import 'package:get/get.dart';
import '../../../../base/base_controller.dart';
import '../../../../utils/app_utils.dart';
import '../../../../utils/helper/text_field_wrapper.dart';
import '../../../../utils/loading/loading_utils.dart';
import '../../../data/model/dto/RepoResponse.dart';
import '../../../data/model/response/generic_response.dart';
import '../../../data/model/resuest/CommunicationPostModel.dart';
import '../../../data/repository/communication_repository.dart';
import 'communication_filter_view_controller.dart';
import 'communication_search_view_controller.dart';

class CreateCommunicationViewController
    extends BaseController<CommunicationRepository> {
  CommunicationSearchViewController controller = Get.find();
  final CommunicationFilterViewController _controller = Get.find();
  TextFieldWrapper communicationName = TextFieldWrapper();
  TextFieldWrapper description = TextFieldWrapper();
  TextFieldWrapper emailSubject = TextFieldWrapper();
  TextFieldWrapper textSubject = TextFieldWrapper();
  TextFieldWrapper emailMessage = TextFieldWrapper();
  TextFieldWrapper textMessage = TextFieldWrapper();
  RxString emailSubjectTextField = RxString("");
  RxString emailMessageTextField = RxString("");

  RxBool smsCheck = false.obs;
  RxBool whatsApp = false.obs;
  RxBool telegram = false.obs;
  RxBool instagram = false.obs;
  RxBool email = false.obs;
  RxBool ivrs = false.obs;

  Future<void> communicationPostModule() async {
    CommunicationRequestModel requestData = CommunicationRequestModel(
        constituency: controller.constituency.controller.text,
        pollingStationName: controller.pollingStationNames.controller.text,
        sectionNoAndName: controller.sectionNameAndNumber.controller.text,
        lastName: controller.lastname.controller.text,
        home: controller.houseNo.controller.text,
        name: controller.name.controller.text,
        ivinIds: controller.ivinIds.toString(),
        voterId: "null",
        contactNumber: _controller.contactCheck.value.toString(),
        profession: _controller.contactModeWrapper.controller.text,
        partyInclinationId: _controller.partyWrapper.controller.text,
        contactMode:_controller.contactModeWrapper.controller.text,
        mandal: controller.mandal.controller.text,
        dissident:_controller.dissident.value.toString(),
        nonLocalAddress: _controller.nonLocalAddress.value.toString(),
        physicallyChallenged: _controller.physicallyChallenged.value.toString(),
        habitationsId: _controller.habitationWrapper.controller.text,
        discription: description.controller.text,
        interestToJoinParty: _controller.interestedToJoinParty.value.toString(),
        caste: _controller.casteWrapper.controller.text,
        email: email.value.toString(),
        status: 'null',
        communicationName: communicationName.controller.text,
        textMessage: textMessage.controller.text,
        communicationType: '');
    LoadingUtils.showLoader();
    RepoResponse<GenericResponse> response =
        await repository.communicationPost(requestModel:requestData );
    LoadingUtils.hideLoader();
    if (response.data?.status == true) {
    } else {
      AppUtils.showSnackBar(response.error?.message ?? 'something went wrong');
    }
  }

}
