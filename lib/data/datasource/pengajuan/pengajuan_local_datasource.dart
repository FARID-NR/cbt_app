import 'package:cbt_app/data/models/response/get_pengajuan_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PengajuanLocalDatasource {
  Future<bool> saveDataPengajuan(PengajuanResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('pengajuan', data.toJson());
    return result;
  }

  Future<bool> getId(PengajuanResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('pengajuan', data.data.matkul.id.toString());
    return result;
  }

  // saya mau membuat future update ketika saya klik tombol dapat ujian maka status akan berubah menjadi true
  // Future<bool> updateDataPengajuan(PengajuanResponseModel data) async {
  //   final pref = await SharedPreferences.getInstance();
  //   final result = await pref.setString('pengajuan', data.toJson());
  //   return result;
  // }
}
