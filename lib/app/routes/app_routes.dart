import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/bindings/advance_data_analytics_campaign_view_binding.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/bindings/update_voter_binding.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/views/relation_view.dart';
import 'package:prasada_political_portfolio/app/modules/advance_data_analytics/views/update_voter_view.dart';
import 'package:prasada_political_portfolio/app/modules/events/bindings/event_plan_page_binding.dart';
import 'package:prasada_political_portfolio/app/modules/events/bindings/event_schedule_page_binding.dart';
import 'package:prasada_political_portfolio/app/modules/events/views/event_create_page.dart';
import 'package:prasada_political_portfolio/app/modules/events/views/event_first_page.dart';
import 'package:prasada_political_portfolio/app/modules/events/views/event_preview_page.dart';
import 'package:prasada_political_portfolio/app/modules/events/views/event_schedule_page.dart';
import 'package:prasada_political_portfolio/app/modules/home/bindings/home_bindings.dart';
import 'package:prasada_political_portfolio/app/modules/home/views/home_view.dart';
import 'package:prasada_political_portfolio/app/modules/login/bindings/login_bindings.dart';
import 'package:prasada_political_portfolio/app/modules/login/view/login_screen.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/bindings/inside_outside_binding.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/bindings/polling_day_binding.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/view/inside_outside_view.dart';
import 'package:prasada_political_portfolio/app/modules/polling_day/view/polling_day_view.dart';
import 'package:prasada_political_portfolio/app/modules/profile/view/profile_about_you.dart';
import 'package:prasada_political_portfolio/app/modules/profile/view/profile_candidate_info.dart';
import 'package:prasada_political_portfolio/app/modules/profile/view/profile_ec_status.dart';
import 'package:prasada_political_portfolio/app/modules/profile/view/profile_political_history.dart';
import 'package:prasada_political_portfolio/app/modules/profile/view/profile_preview.dart';
import 'package:prasada_political_portfolio/app/modules/profile/view/profile_social_media.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/bindings/quick_insight_binding.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/view/add_insight_screen.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/view/insight_search_result_view.dart';
import 'package:prasada_political_portfolio/app/modules/quick_insights/view/qiuch_insight_screen.dart';

import '../modules/advance_data_analytics/bindings/advance_data_analytic_voter_view_binding.dart';
import '../modules/advance_data_analytics/bindings/advance_data_analytics_search_binding.dart';
import '../modules/advance_data_analytics/bindings/apply_filter_page_binding.dart';
import '../modules/advance_data_analytics/bindings/bulk_edit_campaign_details_bindings.dart';
import '../modules/advance_data_analytics/views/advance_data_analytic_voter_view.dart';
import '../modules/advance_data_analytics/views/advance_data_analytics_search_view.dart';
import '../modules/advance_data_analytics/views/apply_filter_page.dart';
import '../modules/advance_data_analytics/views/bulk_card_campaign_view.dart';
import '../modules/advance_data_analytics/views/single_card_campaign_view.dart';
import '../modules/communication/bindings/communication_filter_view_binding.dart';
import '../modules/communication/bindings/communication_search_view_binding.dart';
import '../modules/communication/bindings/communication_view_binding.dart';
import '../modules/communication/bindings/create_communication_view_binding.dart';
import '../modules/communication/bindings/draft_view_binding.dart';
import '../modules/communication/bindings/sent_view_binding.dart';
import '../modules/communication/views/communication_filter_view.dart';
import '../modules/communication/views/communication_search_view.dart';
import '../modules/communication/views/communication_view.dart';
import '../modules/communication/views/create_communication_view.dart';
import '../modules/communication/views/draft_view.dart';
import '../modules/communication/views/sent_view.dart';
import '../modules/data_analytics/bindings/Data_analytic_search_screen_binding.dart';
import '../modules/data_analytics/bindings/campaign_view_binding.dart';
import '../modules/data_analytics/bindings/data_analytics_voter_view_binding.dart';
import '../modules/data_analytics/bindings/edit_view_binding.dart';
import '../modules/data_analytics/views/campaign_view.dart';
import '../modules/data_analytics/views/data_analytics_search_view.dart';
import '../modules/data_analytics/views/data_analytics_voter_cards.dart';
import '../modules/data_analytics/views/edit_view.dart';
import '../modules/events/bindings/event_create_page_binding.dart';
import '../modules/events/bindings/event_first_page_binding.dart';
import '../modules/events/bindings/event_preview_binding.dart';
import '../modules/events/views/event_plan_page.dart';
import '../modules/profile/bindings/profile_bindings.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

class Routes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const DATA_ANALYTICS_SEARCH = '/data_analytics_search';
  static const DATA_ANALYTICS_VOTER_VIEW = '/data_analytics_voter_view';
  static const CAMPAIGN_VIEW = '/campaign_view';
  static const EDIT_VIEW = '/edit_view';
  static const RELATION_VOTER_VIEW = '/relation/voter/view';
  static const ADVANCE_DATA_ANALYTICS_SEARCH = '/advance_data_analytics_search';
  static const ADVANCE_DATA_ANALYTICS_VOTER_VIEW =
      '/advance_data_analytics_voter_view';
  static const FILTER_VIEW = '/filter_view';
  static const UPDATE_VOTER_VIEW = '/update/voter';
  static const FILTER_VOTER_VIEW = '/filter_voter_view';
  static const SINGLE_CARD_CAMPAIGN_VIEW =
      '/advance_data_analytics_campaign_view';

  static const COMMUNICATION = '/communication';
  static const COMMUNICATION_SEARCH_VIEW = '/communication_search_view';
  static const COMMUNICATION_FILTER_VIEW = '/communication_filter_view';
  static const CREATE_COMMUNICATION_VIEW = '/create_communication_view';
  static const SENT_VIEW = '/sent_view';
  static const DRAFT_VIEW = '/draft_view';

  static const BULK_CARD_EDIT = '/bulk_edit';

  static const PROFILE_ABOUT_YOU = '/profile_about_you';
  static const PROFILE_CANDIDATE_INFO = '/profile_candidate_info';
  static const PROFILE_POLITICAL_HISTORY = '/profile_political_history';
  static const PROFILE_SOCIAL_MEDIA = '/profile_social_media';
  static const PROFILE_EC_STATUS = '/profile_ec_status';
  static const PROFILE_PREVIEW_PAGE = '/profile_preview_page';

  static const EVENT_FIRST_PAGE = '/event_first_page';
  static const EVENT_CREATE_PAGE = '/event_create_page';
  static const EVENT_PLAN_PAGE = '/event_plan_page';
  static const EVENT_SCHEDULE_PAGE = '/event_schedule_page';
  static const EVENT_PREVIEW_PAGE = '/event_preview_page';
  static const QUICK_INSIGHTS = '/quick/insight';
  static const ADD_INSIGHT = '/add/insight';
  static const INSIGHT_RESULT_PAGE = '/insight/result/page';

  static const TEST_SCREEN = '/test';

  // Polling Day Routes
  static const POLLING_DAY_PAGE = '/polling_day_view';

  static const INSIDE_OUTSIDE_VIEW = '/outside_inside_view';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.DATA_ANALYTICS_SEARCH,
        page: () => DataAnalyticSearchScreen(),
        binding: Data_analytic_search_screen_binding()),
    GetPage(
        name: Routes.DATA_ANALYTICS_VOTER_VIEW,
        page: () => const data_analytics_voter_view(),
        binding: data_analytics_voter_view_binding()),
    GetPage(
        name: Routes.CAMPAIGN_VIEW,
        page: () => CompaignView(),
        binding: Campaign_view_binding()),
    GetPage(
      name: Routes.RELATION_VOTER_VIEW,
      page: () => RelationVoterView(),
    ),
    GetPage(
        name: Routes.EDIT_VIEW,
        page: () => EditView(),
        binding: Edit_view_binding()),
    GetPage(
        name: Routes.ADVANCE_DATA_ANALYTICS_SEARCH,
        page: () => AdvanceDataAnalyticsSearchView(),
        binding: Advance_data_analytic_search_screen_binding()),
    GetPage(
        name: Routes.ADVANCE_DATA_ANALYTICS_VOTER_VIEW,
        page: () => AdvanceDataAnalyticsVoterView(),
        binding: Advance_data_analytic_voter_binding()),
    GetPage(
        name: Routes.FILTER_VIEW,
        page: () => FilterView(),
        binding: filter_view_binding()),
    GetPage(
        name: Routes.UPDATE_VOTER_VIEW,
        page: () => UpdateVoterDataView(),
        binding: UpdateVoterBindings()),
    // GetPage(
    //     name: Routes.FILTER_VOTER_VIEW,
    //     page: () => Filter_voter_view(),
    //     binding: filter_voter_binding()),
    GetPage(
        name: Routes.SINGLE_CARD_CAMPAIGN_VIEW,
        page: () => SingleCardCampaignView(),
        binding: CampaignBinding()),
    GetPage(
        name: Routes.BULK_CARD_EDIT,
        page: () => BulkCardCampaignView(),
        binding: Bulk_edit_campaign_details_binding()),
    GetPage(
        name: Routes.COMMUNICATION,
        page: () => CommunicationView(),
        binding: CommunicationViewBinding()),
    GetPage(
        name: Routes.COMMUNICATION_SEARCH_VIEW,
        page: () => CommunicationSearchView(),
        binding: CommunicationSearchViewBinding()),
    GetPage(
        name: Routes.COMMUNICATION_FILTER_VIEW,
        page: () => CommunicationFilterView(),
        binding: CommunicationFilterViewBinding()),
    GetPage(
        name: Routes.CREATE_COMMUNICATION_VIEW,
        page: () => CreateCommunicationView(),
        binding: CreateCommunicationViewBinding()),
    GetPage(
        name: Routes.SENT_VIEW,
        page: () => SentView(),
        binding: SentViewBinding()),
    GetPage(
        name: Routes.DRAFT_VIEW,
        page: () => DraftView(),
        binding: DraftViewBinding()),
    GetPage(
        name: Routes.PROFILE_ABOUT_YOU,
        page: () => ProfileAboutYou(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.PROFILE_CANDIDATE_INFO,
        page: () => ProfileCandidateInfo(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.PROFILE_POLITICAL_HISTORY,
        page: () => profilePoliticalHistory(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.PROFILE_SOCIAL_MEDIA,
        page: () => ProfileSocialMedia(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.PROFILE_EC_STATUS,
        page: () => ProfileEcStatus(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.PROFILE_PREVIEW_PAGE,
        page: () => const ProfilePreviewPage(),
        binding: ProfileBinding()),
    GetPage(
        name: Routes.EVENT_FIRST_PAGE,
        page: () => EventFirstPage(),
        binding: EventFirstPageBinding()),
    GetPage(
        name: Routes.EVENT_CREATE_PAGE,
        page: () => const EventCreatePage(),
        binding: EventCreatePageBinding()),
    GetPage(
        name: Routes.EVENT_PLAN_PAGE,
        page: () => const EventPlanPage(),
        binding: EventPlanPageBinding()),
    GetPage(
        name: Routes.EVENT_SCHEDULE_PAGE,
        page: () => const EventSchedulePage(),
        binding: EventSchedulePageBinding()),
    GetPage(
        name: Routes.EVENT_PREVIEW_PAGE,
        page: () => EventPreviewPage(),
        binding: EventPreviewBinding()),

    GetPage(
        name: Routes.QUICK_INSIGHTS,
        page: () => QuickInsightsView(),
        binding: QuickInsightBindings()),

    GetPage(
      name: Routes.ADD_INSIGHT,
      page: () => AddInsightsScreen(),
    ),

    GetPage(
      name: Routes.INSIGHT_RESULT_PAGE,
      page: () => InsightsSearchResultView(),
    ),

    // Polling data Routes

    GetPage(
      name: Routes.POLLING_DAY_PAGE,
      page: () => PollingDayView(),
      binding: PollingDayBinding(),
    ),

    GetPage(
      name: Routes.INSIDE_OUTSIDE_VIEW,
      page: () => InsideOutsideView(),
      binding: InsideOutsideBinding(),
    )
  ];
}
