import 'package:prasada_political_portfolio/app/data/model/dto/RepoResponse.dart';
import 'package:prasada_political_portfolio/app/data/model/response/generic_response.dart';
import 'package:prasada_political_portfolio/app/data/model/resuest/login_request.dart';
import 'package:prasada_political_portfolio/app/data/values/urls.dart';
import 'package:prasada_political_portfolio/base/base_repository.dart';
import 'package:prasada_political_portfolio/utils/helper/exception_handler.dart';

class AuthRepository extends BaseRepository {
  Future<RepoResponse<GenericResponse>> login(LoginRequest data) async {
    final response = await controller.post(path: URLs.login, data: data.toJson());
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: GenericResponse.fromJson(response));
  }
}
