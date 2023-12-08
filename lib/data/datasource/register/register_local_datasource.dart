import 'package:cbt_app/data/models/response/register_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(RegistertResponseModel model) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('regist_data', model.toJson());
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('regist_data');
  }

  

  // Future<RegistertResponseModel?> getAuthData() async {
  //   final pref = await SharedPreferences.getInstance();
  //   final authData = pref.getString('regist_data');
  //   if (authData != null) {
  //     return RegistertResponseModel.fromJson(authData);
  //   } else {
  //     return null;
  //   }
  // }

}