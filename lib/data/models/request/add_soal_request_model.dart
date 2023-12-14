import 'package:image_picker/image_picker.dart';

class AddSoalRequestModel {
  final String matkulId;
  final String soal;
  final String tingkat;
  final XFile image;
  final double? lat;
  final double? long;

  AddSoalRequestModel({
    required this.matkulId,
    required this.soal,
    required this.tingkat,
    required this.image,
    this.lat,
    this.long,
  });

  Map<String, String> toJson() {
    if (lat == null && long == null) {
      return {
        'matkul_id': matkulId,
        'soal': soal,
        'tingkat': tingkat
      };
    }

    return {
      'matkul_id': matkulId,
      'soal': soal,
      'tingkat': tingkat,
      'updated_at': lat?.toString() ?? '',
      'created_at': long?.toString() ?? '',
    };
  }
}