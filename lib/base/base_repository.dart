import 'package:get/get.dart';
import 'package:prasada_political_portfolio/app/data/network/network_requester.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
