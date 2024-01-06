import 'package:cbt_app/data/models/response/dapat_ujian_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DapatUjianLocalDatasource {
  Future<bool> saveDataDapatUjian(DapatUjianResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('dapat_ujian', data.toJson());
    return result;
  }

   Future<bool> saveStatusDapatUjian(DapatUjianResponseModel data, bool isClicked) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('isClicked', isClicked);
  }
  
}