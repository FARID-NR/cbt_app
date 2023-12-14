import 'package:cbt_app/data/models/response/endpoint_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EndpointLocalDatasource {
  Future<bool> saveDataEndpoint(EndpointResponseModel data) async {
    final pref = await SharedPreferences.getInstance();
    final result = await pref.setString('endpoint', data.toJson());
    return result;
  }

  Future<List<int>> getIdEndpoint() async {
    final pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('endpoint') ?? '';

    try {
      final endpointModel = EndpointResponseModel.fromJson(jsonString);

      if (endpointModel.data.isNotEmpty) {
        List<int> allIds = [];
        for (var item in endpointModel.data) {
          allIds.add(item.id);
        }
        return allIds;
      }
    } catch (e) {
      print('Error parsing JSON: $e');
    }

    return []; // Mengembalikan daftar kosong jika tidak ada data atau ID yang tersedia
  }

  // Future<int> getIdEndpoint() async {
  //   final pref = await SharedPreferences.getInstance();
  //   final jsonString = pref.getString('endpoint') ?? '';

  //   final endpointModel = EndpointResponseModel.fromJson(jsonString);
  //   return endpointModel.data.id;
  // }

  // Future<int?> getIdEndpoint() async {
  //   final pref = await SharedPreferences.getInstance();
  //   final jsonString = await pref.getString('endpoint') ?? '';

  //   final endpointModel = EndpointResponseModel.fromJson(jsonString);

  //   if (endpointModel.data.isNotEmpty) {
  //     // debugPrint(endpointModel.data.toString());
  //     final userData = endpointModel.data.last;
  //     return userData.id;
  //   }

  //   return null; // Mengembalikan null jika tidak ada data atau ID yang tersedia
  // }
}
