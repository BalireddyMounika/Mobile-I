class URLs {
  URLs._privateConstructor();

  static const baseURL = "http://13.234.70.44:8000";
  // static const baseURL = "http://172.105.37.117:8000";
  static const polling = baseURL + "/UserIvin-API/PollingStationName/";
  static const pollingstationname =
      baseURL + "/UserIvin-API/GetAllPollingStationName/";
  static const pollingnamesbymandal =
      baseURL + " /UserIvin-API/PollingStationNameAndNum/";
  static const state = baseURL + "/UserIvin-API/GetAllStateNames";
  static const district = baseURL + "/UserIvin-API/GetAllConstituencyNames/";
  static const pollingstationnumber =
      baseURL + "/UserIvin-API/GetAllPollingStationNumbers/";
  static const section = baseURL + "/UserIvin-API/getallsectionnumberandname/";
  static const voterdetails =
      baseURL + "/UserIvin-API/DataAnalyticsGetByFields";
  static const pollingstationlocation =
      baseURL + "/UserIvin-API/GetAllpollingstationlocation/";
  // static const login = baseURL + '/UserIvin-API/login_mobile/';
  // ////////////////////
  static const login = baseURL + "/Ivin_1/LoginV1view/";

  static const pollingStations = baseURL + '/Ivin_1/GetpollingstationbyEmail/';

  static const getOutsidePollingData = baseURL + "/Ivin_1/GetOutsideVoter/";

  static const getInsidePollingData = baseURL + "/Ivin_1/GetInsideVoter/";

  static const outsideURL = '/Ivin_1/OutsideVoterUpdateVoter2024/';

  static const insideURL = '/Ivin_1/InsideVoterUpdateVoter2024/';

  static const getPollingStationCount = baseURL + "/Ivin_1/GetNoOfVoter/";

  static const deviceIdAddress = baseURL + "/Ivin_1/DeviceidUpdate/";

  static const isVotedData = baseURL + "/Ivin_1/GetIsVotedData/";

  static const getVoterSerialNumber = baseURL + "/Ivin_1/GetVoterSerialNumber/";

  static const getPollingStationNumberName =
      baseURL + "/Ivin_1/GetpollingstationbyEmail/";

  static const getAllStationDetailsAtOnce =
      baseURL + '/Ivin_1/GetCountOfVotersformobile/';
  // //////////////////////////////////////////////////////

  static const campaign_post = baseURL + '/UserIvin-API/CampaignPost/';
  static const campaign_get = baseURL + '/UserIvin-API/CampaignGetbyIvinId/';
  static const mandal = baseURL + '/UserIvin-API/GetAllMandalNames/';
  static const campaign_update = baseURL + '/UserIvin-API/CampaignUpdate/';
  static const filter = baseURL + '/UserIvin-API/GetCampaignExcludeFields/';
  static const quick_insight_filter =
      baseURL + "/quickinsights/GetdataCampaignincludeFileds/";
  static const metabase = baseURL + "/metabase/";

  // static const bot = "http://ivinbot.vivifyhealthcare.com/";
  static const bot =
      'http://ivinbot.vivifyhealthcare.com:5005/webhooks/rest/webhook';

  static const image = baseURL + "/imageupload/GetImageByName/";
  static const bulk_update = baseURL + '/UserIvin-API/LastNameBulkUpdate/';
  static const profile_images = baseURL + '/imageupload/PostImages/';
  static const profile_about_you =
      baseURL + '/candidate_profile/UserProfileAPI/';
  static const quick_insight_search =
      baseURL + "/quickinsights/SearchDataAnalyticsForData/";
  static const communication_search =
      baseURL + "/communicationmodule/SearchDataAnalytics/";

  //new imp

  static const getMandalByConstituency =
      baseURL + "/UserIvin-API/GetAllMandalNames";

  static const getAllDistrictName =
      baseURL + "/UserIvin-API/GetAllDistrictNames";

  static const getAllDistrictConstituency =
      baseURL + "/UserIvin-API/GetAllConstituencyNames";

  static const updateVoterDataById =
      baseURL + "/UserIvin-API/GetByVoterIdDataAnalytics";

  static const getAllPollingStationNameAndNum =
      baseURL + "/UserIvin-API/PollingStationNameAndNum";

  static const getImageUpload = baseURL + "/imageupload/GetImageByName";

  static const getAllSectionNumberAndName =
      baseURL + "/UserIvin-API/getallsectionnumberandname";

  static const getPolingStationLocation =
      baseURL + "/UserIvin-API/GetAllpollingstationlocation";

  static const getAllPolingStationNumber =
      baseURL + "/UserIvin-API/GetAllPollingStationNumbers";

  static const getDataAnalyticsBysearchfilterV2 =
      baseURL + "/UserIvin-API/V2GetDataAnalyticsBysearchfilterV2";

  static const scheme = baseURL + '/UserIvin-API/GetAllSchemes/';

  static const habitation = baseURL + "/UserIvin-API/GetAllHabitations/";

  static const communicationFilter =
      baseURL + '/communicationmodule/IncludedatInCommunicationModule/';

  static const communicationModulePost =
      baseURL + '/communicationmodule/CommunicationModulePost/';

  static const botV2DataAnalyticsGetByFields =
      baseURL + "/UserIvin-API/BotV2DataAnalyticsGetByFields";

  static const imageuploadGetImageByName =
      baseURL + "/imageupload/GetImageByName";

  static const getAllPartyNames = baseURL + '/UserIvin-API/GetAllPartyNames/';

  static const getAllQuickInsightsData =
      baseURL + '/quickinsights/GetAllQuickInsightsData/';

  static const postAllProfileAboutData =
      baseURL + '/candidate_profile/UserProfileAPI/';

  static const postAllProfilePoliticalData =
      baseURL + '/candidate_profile/PoliticalHistoryView/';

  static const quickinsightsSearchDataAnalyticsForData =
      baseURL + '/quickinsights/SearchDataAnalyticsForData/';

  static const saveSearchInsights =
      baseURL + '/quickinsights/QuickInsightsForDataPost/';

  static const updateInsights =
      baseURL + '/quickinsights/UpdateQuickInsightsForData/';

  // static const token =
  //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk1NzkxODUyLCJpYXQiOjE2ODgwMTU4NTIsImp0aSI6IjEwZjg1NWMyMjkwYjQ3MTg5MmU3NDAwZGNhZWQxZTA0IiwidXNlcl9pZCI6M30.HTtK2OX8_u9ul3-6jlswZjMZYwAAdtsoGT8-yXRdcGw';
  static const token =
      // staging
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzEwMjI3ODI5LCJpYXQiOjE3MDI0NTE4MjksImp0aSI6IjkxMTc0MjM5MjM2MjQwZmY5NTVmNThkY2I1MmQ4MjExIiwidXNlcl9pZCI6MX0.EPKbAW4NpDSK8z_cVB2ZECJrMZk3X4xykSffjNPxTjk";
  // Production token
  // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA5NTMzMzQ0LCJpYXQiOjE3MDE3NTczNDQsImp0aSI6IjlmZDAzMTUzYmUzZTQ4MjdiMDM1NTdjNWFkNzMyYTM5IiwidXNlcl9pZCI6Mn0.8qoWaUFlKj0lciCQlAo_dFqieaIfcyDTBXQ40ssg5X4';
}
