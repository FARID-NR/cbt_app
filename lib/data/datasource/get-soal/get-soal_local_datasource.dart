import 'package:cbt_app/data/models/response/get_soal_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetsoalLocalDatasource {
  Future<bool> saveDataGetSoal(GetSoalResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('soal', data.toJson());
    return result;
  }

  Future<bool> getId(GetSoalResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('soal', data.data.id.toString());
    return result;
  }

//   Future<Data> getIdEndpoint() async {
//   final pref = await SharedPreferences.getInstance();
//   final jsonString = pref.getString('soal') ?? '';

//   final endpointModel = GetSoalResponseModel.fromJson(jsonString);

//   // Ambil semua objek Data dari model
//   Data dataList = endpointModel.data.id as Data;

//   // Ambil semua ID dari setiap objek Data
//   List<int> idList = dataList.map((data) => data.id).toList();

//   return dataList; // Mengembalikan daftar semua objek Data
// }


}
