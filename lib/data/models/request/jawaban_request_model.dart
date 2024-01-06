import 'package:image_picker/image_picker.dart';

class JawabanRequestModel {
  final String jawabanA;
  final String jawabanB;
  final String jawabanC;
  final String jawabanD;
  final String jawabanE;
  final String benar;
  final XFile imageA;
  final XFile imageB;
  final XFile imageC;
  final XFile imageD;
  final XFile imageE;
  final double? lat;
  final double? long;

  JawabanRequestModel({
    required this.jawabanA,
    required this.jawabanB,
    required this.jawabanC,
    required this.jawabanD,
    required this.jawabanE,
    required this.benar,
    required this.imageA,
    required this.imageB,
    required this.imageC,
    required this.imageD,
    required this.imageE,
    this.lat,
    this.long,
  });

  Map<String, String> toJson() {
    if (lat == null && long == null) {
      return {
        'jawabanA': jawabanA,
        'jawabanB': jawabanB,
        'jawabanC': jawabanC,
        'jawabanD': jawabanD,
        'jawabanE': jawabanE,
        'benar': benar,
      };
    }

    return {
      'jawabanA': jawabanA,
      'jawabanB': jawabanB,
      'jawabanC': jawabanC,
      'jawabanD': jawabanD,
      'jawabanE': jawabanE,
      'benar': benar,
      'updated_at': lat?.toString() ?? '',
      'created_at': long?.toString() ?? '',
    };
  }
}