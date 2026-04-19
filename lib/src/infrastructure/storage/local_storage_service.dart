import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sabaa/src/logger/log_services/dev_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../application/data/user_information/user_information.dart';
import '../../core/utils/constants/keys.dart';
import 'hive/hive_boxes.dart';
part 'local_storage_service.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) => LocalStorageService(ref);

class LocalStorageService {
  LocalStorageService(this.ref);

  final Ref ref;

  // ============================
  // Storage instances
  // ============================
  static const _secureStorage = FlutterSecureStorage();
  static const _userInfoBoxName = HiveBoxesName.userInfoBox;

  Box<UserInformation> get _userBox =>
      Hive.box<UserInformation>(_userInfoBoxName);

  // ============================
  // INIT
  // ============================
  Future<void> init() async {
    await Hive.openBox<UserInformation>(_userInfoBoxName);
  }

  // ============================
  // TOKEN (SECURE)
  // ============================
  Future<void> saveToken(String token) async {
    await _secureStorage.write(
      key: Keys.securedToken,
      value: token,
    );
  }

  Future<String?> getToken() async {
    final token= await _secureStorage.read(key: Keys.securedToken);
    Dev.logLine("TOKEN $token");
    return token;

  }

  Future<void> removeToken() async {
    await _secureStorage.delete(key: Keys.securedToken);
    Dev.logLine("TOKEN REMOVED");
    getToken();
  }

  // ============================
  // USER INFO (HIVE)
  // ============================
  UserInformation get userInfo =>
      _userBox.get(0) ?? UserInformation.empty();

  Future<void> saveUserInfo(UserInformation info) async {
    await _userBox.put(0, info);
  }

  Future<void> updateBasicUserInfo({
    String? fullName,
    String? email,
    String? phone,
  }) async {
    final current = _userBox.get(0);
    if (current == null) return;

    final updated = current.copyWith(
      fullName: fullName ?? current.fullName,
      // email: email??current.email,
      // mobileNumber: phone??current.mobileNumber,
    );

    await _userBox.put(0, updated);
  }

  Future<void> removeUserInfo() async {
    await _userBox.delete(0);
  }

  // ============================
  // FIRST TIME OPEN FLAG
  // ============================
  Future<bool> isFirstTimeOpen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Keys.firstTime) ?? true;
  }

  Future<void> markAppOpened() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Keys.firstTime, false);
  }

  // ============================
  // LOGOUT (ONE CALL)
  // ============================
  Future<void> logout() async {
    await removeToken();
    await removeUserInfo();
  }
}
@riverpod
Future<bool> isAuthenticated(Ref ref) async {
  final storage = ref.read(localStorageServiceProvider);
  final token = await storage.getToken();
  return token != null && token.isNotEmpty;
}
