import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../src/core/utils/constants/keys.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async =>
    await SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  (String, int)? build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider).requireValue;
    final token = sharedPrefs.getString(Keys.token);
    final userId = sharedPrefs.getInt(Keys.userId);
    if (token != null && userId != null) {
      return (
        sharedPrefs.getString(Keys.token)!,
        sharedPrefs.getInt(Keys.userId)!
      );
    }
    return null;
  }

  Future<void> setData(String token, int userId) async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.setString(Keys.token, token);
    await sharedPrefs.setInt(Keys.userId, userId);

    state = (token, userId);
  }

  Future<void> removeData() async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.remove(Keys.token);
    await sharedPrefs.remove(Keys.userId);
    state = null;
  }
}

@riverpod
bool isAuthinticated(Ref ref) {
  return ref.watch(userDataProvider) != null;
}
