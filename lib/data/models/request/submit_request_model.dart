
class SubmitRequestModel {
  final String userId;
  final String soal;
  final double? lat;
  final double? long;

  SubmitRequestModel({
    required this.userId,
    required this.soal,
    this.lat,
    this.long,
  });

  Map<String, String> toJson() {
    if (lat == null && long == null) {
      return {
        'user_id': userId,
        'soal': soal
      };
    }

    return {
      'user_id': userId,
      'soal': soal,
      'updated_at': lat?.toString() ?? '',
      'created_at': long?.toString() ?? '',
    };
  }
}