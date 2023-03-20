import 'package:macros/src/features/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static Future<String?> setGlobalUser(UserModel user) async {
    try {
      final shared = await SharedPreferences.getInstance();

      await shared.setString('UserData', user.toJson());

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String?> clearGlobalUser() async {
    try {
      final shared = await SharedPreferences.getInstance();

      final res = await shared.clear();

      if (res) {
        return null;
      }
      return 'Erro';
    } catch (e) {
      return e.toString();
    }
  }
}
