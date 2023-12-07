import 'package:cbt_app/data/models/response/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDatasource {
  Future<bool> saveLoginData(LoginResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('login', data.toJson());
    return result;
  }

  Future<void> removeLoginData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('login');
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('login') ?? '';

    final loginModel = LoginResponseModel.fromJson(jsonString);
    // debugPrint(loginModel.data.token);
    return loginModel.data.token;
  }

  Future<String> getRoles() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('login') ?? '';

    final loginModel = LoginResponseModel.fromJson(jsonString);
    return loginModel.data.roles;
  }

  Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    final loginJson = pref.getString('login') ?? '';
    return loginJson.isNotEmpty;
  }
}
