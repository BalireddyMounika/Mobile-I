import 'package:get_storage/get_storage.dart';
import 'package:prasada_political_portfolio/app/data/model/dto/User.dart';

class AppStorage {
  AppStorage._privateConstructor();

  static final _box = GetStorage();

  static User getUser() => User.fromJson(_box.read(StorageKeys.USER));

  static void setUser(User? user) =>
      _box.write(StorageKeys.USER, user?.toJson());

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;

  static void clear() async {
    _box.erase();
    print(isUserExists());
  }
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const APP_CONFIG = 'app_config';
  static const USER = 'user';
}
