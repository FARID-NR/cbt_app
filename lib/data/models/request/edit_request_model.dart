import 'package:image_picker/image_picker.dart';

class EditRequestModel {
  final String soal;
  final String tingkat;
  final XFile? image;
  final double? lat;
  final double? long;

  EditRequestModel({

    required this.soal,
    required this.tingkat,
    this.image,
    this.lat,
    this.long,
  });

  Map<String, String> toJson() {
    if (lat == null && long == null) {
      return {
        'soal': soal,
        'tingkat': tingkat
      };
    }

    return {
      'soal': soal,
      'tingkat': tingkat,
      'updated_at': lat?.toString() ?? '',
      'created_at': long?.toString() ?? '',
    };
  }
}