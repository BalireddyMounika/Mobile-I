import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/PollingStationPDFDownloadModel.dart';
import 'package:prasada_political_portfolio/app/data/model/response/PollingVoterSerialDetails.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/PollingStationDownloadModel.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/inside_vote_model.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/outside_vote_model.dart';
import 'package:prasada_political_portfolio/app/data/repository/polling_day_repository.dart';
import 'package:prasada_political_portfolio/app/data/values/dimens.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/controllers/polling_day_view_controller.dart';
import 'package:prasada_political_portfolio/app/themes/app_colors.dart';
import 'package:prasada_political_portfolio/base/base_controller.dart';
import 'package:prasada_political_portfolio/utils/app_utils.dart';
import 'package:prasada_political_portfolio/utils/helper/text_field_wrapper.dart';
import 'package:prasada_political_portfolio/utils/loading/loading_utils.dart';
import 'package:prasada_political_portfolio/utils/storage/storage_utils.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

// excel

import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;

class InsideOutsideController extends BaseController<PollingStationRepository> {
  final PollingDayViewController pollingDayViewController =
      Get.find<PollingDayViewController>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      selected.value = Get.arguments;
      pollingStations.controller.text = Get.arguments;
      getAllVoters(Get.arguments);
      getTotalVoters(Get.arguments);
      getNoofMarkedVotees(Get.arguments);
    }
    generateDropDownList();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // User has reached the end of the list, load more data
      loadMoreData();
    }
  }

  void loadMoreData() async {
    if (isLoading.value) {
      return; // Don't load more data if already loading
    }
    if (!isLastPage.value) {
      // isLoading.value = true;
      currentPage++;
      getAllVoters(selected.value);
      getNoofMarkedVotees(selected.value);
      // isLoading.value = false;
      // scrollController.jumpTo(500);
    }
  }

  setSelected(String value) async {
    currentPage = 1;
    selected.value = value;
    pollingStations.controller.text = selected.value;
    noofMarkedVotes.value = 0;
    tempVoters.clear();
    insideVoters.clear();
    outsideVoters.clear();
    insideVotedVoters.clear();
    outSideVotedVoters.clear();
    isLocalSelected.value = false;
    isNonLocalSelected.value = false;
    selectedFilterOption.clear();

    try {
      isLoading.value = true;

      await getAllVoters(selected.value);

      isLoading.value = false;
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  generateDropDownList() {
    dropDownList.clear();
    for (var i in pollingDayViewController.pollingStationList) {
      dropDownList.add(i);
    }
  }

  int currentPage = 1;
  RxBool isLastPage = RxBool(false);

  final ScrollController scrollController = ScrollController();
  TextFieldWrapper pollingStations = TextFieldWrapper();

  RxList<String> dropDownList = <String>[].obs;

  RxBool isOutSideSelected = true.obs;
  RxBool isLoading = false.obs;

  RxString selected = "".obs;

  RxInt totalVoters = 0.obs;
  RxInt noofMarkedVotes = 0.obs;

  RxList partyListandColor = RxList([
    {"color": AppColors.blue, "text": "YSRCP"},
    {"color": AppColors.YellowColor, "text": "TDP"},
    {"color": Colors.red, "text": "Janasena"},
    {"color": Colors.orange, "text": "BJP"},
    {"color": AppColors.greyColor, "text": "Neutral"},
    {"color": AppColors.whiteColor, "text": "Others"},
    {"svg": "assets/images/aeroplane.svg", "text": "Non Local Address"},
    {"svg": "assets/images/poling.svg", "text": "Local Address"},
  ]);

  RxBool isLocalSelected = RxBool(false);
  RxBool isNonLocalSelected = RxBool(false);
  RxBool isListSelectorEnabled = RxBool(true);

  ValueNotifier<bool> isLoadingVoters = ValueNotifier<bool>(false);

  Map<String, String> filterOptions = {
    'TDP': 'Telugu Desam Party',
    'YSRCP': 'Yuvajana Sramika Rythu Congress Party',
    'Janasena': 'Janasena Party',
    'BJP': 'Bharatiya Janata Party',
    'Neutral': 'Neutral',
    'Other Party': 'Others',
  };

  RxList<String> selectedFilterOption = RxList();
  RxList<PollingVoterSerialDetails> tempVoters = RxList();
  RxList<PollingVoterSerialDetails> insideVoters = RxList();
  RxList<PollingVoterSerialDetails> outsideVoters = RxList();
  RxList<PollingVoterSerialDetails> insideVotedVoters = RxList();
  RxList<PollingVoterSerialDetails> outSideVotedVoters = RxList();

  RxList<PollingStationPdfDownloadModel> downloadPDFList =
      <PollingStationPdfDownloadModel>[].obs;

  // Switch Controllers

  onSwitchSelect() {
    isOutSideSelected.toggle();
    if (isOutSideSelected.value) {
      tempVoters.clear();
      tempVoters.assignAll(outsideVoters);
      tempVoters.refresh();
    } else {
      tempVoters.clear();
      tempVoters.assignAll(insideVoters);
      tempVoters.refresh();
    }
  }

  Future<void> getAllVoters(String stationName) async {
    isListSelectorEnabled.value = false;
    if (currentPage == 1) {
      isLoadingVoters.value = true;
    }
    try {
      RepoResponse<GenericResponse> response =
          await repository.getPaginationResponseData(
        token: AppStorage.getUser().bearerToken ?? '',
        url: URLs.getVoterSerialNumber,
        stationName: stationName,
        page: currentPage.toString(),
        perPage: '800',
      );

      if (response.data?.status == 200 || response.data?.status == 201) {
        var data = response.data?.result as List;
        for (var i in data) {
          if (i['outside_voter'] == true) {
            outSideVotedVoters.add(PollingVoterSerialDetails.fromJson(i));
          } else if (i['outside_voter'] == false ||
              i['outside_voter'] == null) {
            outsideVoters.add(PollingVoterSerialDetails.fromJson(i));
          }

          if (i['inside_voter'] == true) {
            insideVotedVoters.add(PollingVoterSerialDetails.fromJson(i));
          } else if (i['inside_voter'] == false || i['inside_voter'] == null) {
            insideVoters.add(PollingVoterSerialDetails.fromJson(i));
          }
        }
        tempVoters.assignAll(outsideVoters);
        tempVoters.refresh();
        isLoadingVoters.value = false;
      } else {
        isLoadingVoters.value = false;
        AppUtils.showSnackBar(
            response.error?.message ?? 'something went wrong');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoadingVoters.value = false;
      isListSelectorEnabled.value = true;
    }
  }

  onVote(
      {required String stationName,
      required String srNum,
      required bool isValue,
      required int index}) async {
    try {
      dynamic requestData;

      if (isOutSideSelected.value) {
        requestData = OutsideVoteModel(outsideVoter: isValue);
      } else {
        requestData = InsideVoteModel(insideVoter: isValue);
      }
      LoadingUtils.showLoader();

      RepoResponse<GenericResponse> response = await repository.updateVote(
        stationUrl: isOutSideSelected.value ? URLs.outsideURL : URLs.insideURL,
        id: srNum,
        token: AppStorage.getUser().bearerToken ?? '',
        stationName: stationName,
        requestData: requestData,
      );
      if (response.data?.status == 200 || response.data?.status == 201) {
        handleVotes(isValue, index);
      } else {
        LoadingUtils.hideLoader();
        AppUtils.showSnackBar(response.error?.message ??
            response.data?.message ??
            'Something went wrong');
      }
    } catch (e) {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    } finally {
      if (LoadingUtils.isLoaderShowing) LoadingUtils.hideLoader();
    }
  }

  void handleVotes(bool isValue, int index) {
    tempVoters.clear();
    if (isOutSideSelected.value) {
      if (isValue) {
        outSideVotedVoters.add(outsideVoters[index]);
        outsideVoters.remove(outsideVoters[index]);
        print(true);
      } else {
        outsideVoters.add(outSideVotedVoters[index]);
        outSideVotedVoters.remove(outSideVotedVoters[index]);
        print(false);
      }
      tempVoters.assignAll(outsideVoters);
    } else {
      if (isValue) {
        noofMarkedVotes.value = noofMarkedVotes.value + 1;
        print(noofMarkedVotes);
        insideVotedVoters.add(insideVoters[index]);
        insideVoters.remove(insideVoters[index]);
        print(true);
      } else {
        noofMarkedVotes.value = noofMarkedVotes.value - 1;
        print(noofMarkedVotes);

        insideVoters.add(insideVotedVoters[index]);
        insideVotedVoters.remove(insideVotedVoters[index]);
        print(false);
      }
      tempVoters.assignAll(insideVoters);
    }
    tempVoters.sort((a, b) => int.parse(a.voterSerialNumber ?? "")
        .compareTo(int.parse(b.voterSerialNumber ?? "")));

    isOutSideSelected.value
        ? outSideVotedVoters.sort((a, b) => int.parse(a.voterSerialNumber ?? "")
            .compareTo(int.parse(b.voterSerialNumber ?? "")))
        : insideVotedVoters.sort((a, b) => int.parse(a.voterSerialNumber ?? "")
            .compareTo(int.parse(b.voterSerialNumber ?? "")));

    tempVoters.refresh();
  }

  Future<void> getNoofMarkedVotees(stationName) async {
    RepoResponse<GenericResponse> noofMarkedVotesResponse =
        await repository.getResponseData(
      url: URLs.isVotedData,
      stationName: stationName,
      token: AppStorage.getUser().bearerToken ?? '',
    );

    if (noofMarkedVotesResponse.data?.status == 200 ||
        noofMarkedVotesResponse.data?.status == 201) {
      noofMarkedVotes.value =
          noofMarkedVotesResponse.data?.result['IsVotedCount'] as int;
    } else {
      AppUtils.showSnackBar(
          noofMarkedVotesResponse.error?.message ?? 'something went wrong');
    }
  }

  applyFilter() {
    tempVoters.clear();

    List<PollingVoterSerialDetails> votersToFilter =
        isOutSideSelected.value ? outsideVoters : insideVoters;

    votersToFilter.forEach((element) {
      if (selectedFilterOption.isNotEmpty &&
          !selectedFilterOption.contains(element.partyInclination)) {
        return;
      }

      if ((isNonLocalSelected.value && element.nonLocalAddress == true) ||
          (isLocalSelected.value && element.nonLocalAddress != true)) {
        tempVoters.add(element);
      } else if (!isNonLocalSelected.value && !isLocalSelected.value) {
        tempVoters.add(element);
      }
    });
  }

  void addToSelectedFilterOptions(String value) {
    if (selectedFilterOption.contains(value)) {
      selectedFilterOption.remove(value);
    } else {
      selectedFilterOption.add(value);
    }
    selectedFilterOption.refresh();
  }

  void getTotalVoters(String stationName) async {
    RepoResponse<GenericResponse> request = await repository.getResponseData(
        url: URLs.getPollingStationCount,
        token: AppStorage.getUser().bearerToken ?? '',
        stationName: stationName);
    if (request.data?.status == 200) {
      totalVoters.value = request.data?.result['No.Of.Voter'] as int;
    } else {
      AppUtils.showSnackBar(request.error?.message ?? 'something went wrong');
    }
  }

  Future<void> downloadPDF({
    required String stationName,
  }) async {
    downloadPDFList.clear();
    String srNumbers =
        outsideVoters.map((voter) => voter.voterSerialNumber).join(',');

    if (srNumbers != "") {
      PollingStationDownloadModel downloadFields = PollingStationDownloadModel(
          pollingStationName: stationName, voterSerialNumber: srNumbers);

      RepoResponse<GenericResponse> response =
          await repository.downloadStationData(
        data: downloadFields,
        token: AppStorage.getUser().bearerToken ?? '',
      );

      if (response.data?.status == 200) {
        var downloadResponse = response.data?.result as List;

        for (var i in downloadResponse) {
          downloadPDFList.add(PollingStationPdfDownloadModel.fromJson(i));
        }
      }
      // generatePdf();
      generateAndSaveExcel();
    }
  }

  Future<void> generatePdf() async {
    final doc = pw.Document();

    doc.addPage(pw.MultiPage(
      build: (context) => [
        _contentTable(context),
      ],
    ));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  pw.Widget _contentTable(pw.Context context) {
    const tableHeaders = [
      'S.No',
      'VoterID',
      'Name',
      'PartyName',
      'Contact',
      'Voted'
    ];

    return pw.TableHelper.fromTextArray(
      cellPadding: pw.EdgeInsets.only(left: Dimens.gapX1),
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        color: PdfColor.fromInt(0xffF04A3D),
      ),
      headerHeight: 30,
      cellHeight: 40,
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.center,
        2: pw.Alignment.centerLeft,
        3: pw.Alignment.center,
        4: pw.Alignment.center,
        5: pw.Alignment.center,
      },
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontSize: 11,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        fontSize: 9,
      ),
      rowDecoration: const pw.BoxDecoration(
        border: pw.Border(
          left: pw.BorderSide(
            width: .5,
          ),
          right: pw.BorderSide(
            width: .5,
          ),
          bottom: pw.BorderSide(
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        downloadPDFList.length,
        (row) => List<String>.generate(
          tableHeaders.length,
          (col) => downloadPDFList[row].getIndex(col),
        ),
      ),
    );
  }

  Timer? _timer;

  int remainingSeconds = 1;
  final time = '00.00'.obs;

  @override
  void onReady() {
    _startTimer(1000);
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }

  Future<void> generateAndSaveExcel() async {
    final xcel.Workbook workbook =
        xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[
        0]; // the sheet we will be populating (only the first sheet)
    String excelFile = selected.value.toString();

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    sheet.getRangeByIndex(1, 1).setText('Polling Day RESULT');
    sheet.getRangeByIndex(2, 1).setText(selected.value); // example class

    sheet.getRangeByIndex(4, 1).setText('Sr Number');
    sheet.getRangeByIndex(4, 2).setText('Voter ID');
    sheet.getRangeByIndex(4, 3).setText('Name');
    sheet.getRangeByIndex(4, 4).setText('Party Name');
    sheet.getRangeByIndex(4, 5).setText('contact');
    sheet.getRangeByIndex(4, 6).setText('Voted');

    // loop through the results to set the data in the excel sheet cells
    for (var i = 0; i < downloadPDFList.length; i++) {
      sheet
          .getRangeByIndex(i + 5, 1)
          .setText(downloadPDFList[i].voterSerialNumber.toString());
      sheet
          .getRangeByIndex(i + 5, 2)
          .setText(downloadPDFList[i].voterId.toString());
      sheet
          .getRangeByIndex(i + 5, 3)
          .setText(downloadPDFList[i].name.toString());
      sheet
          .getRangeByIndex(i + 5, 4)
          .setText(downloadPDFList[i].partyInclination?.partyName.toString());
      sheet
          .getRangeByIndex(i + 5, 5)
          .setText(downloadPDFList[i].contactNumber.toString());
      sheet
          .getRangeByIndex(i + 5, 6)
          .setText(downloadPDFList[i].outsideVoter.toString());
    }

    // save the document in the downloads file
    final List<int> bytes = workbook.saveAsStream();
    File('/storage/emulated/0/Download/$excelFile.xlsx').writeAsBytes(bytes);
    Fluttertoast.showToast(
      msg: 'Excel file successfully downloaded',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.purple,
      textColor: AppColors.whiteColor,
    );

    //dispose the workbook
    // workbook.dispose();
  }
}
