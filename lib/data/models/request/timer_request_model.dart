
class TimerRequestModel {
  final String? finishDate;
  final String? finishTime;
  final double? lat;
  final double? long;

  TimerRequestModel({
    this.finishDate,
    this.finishTime,
    this.lat,
    this.long,
  });

  Map<String, String> toJson() {
    if (lat == null && long == null) {
      return {
        'finish_date': finishDate ?? '',
        'finish_time': finishTime ?? ''
      };
    }

    return {
      'finish_date': finishDate ?? '',
      'finish_time': finishTime ?? '',
      'updated_at': lat?.toString() ?? '',
      'created_at': long?.toString() ?? '',
    };
  }
}