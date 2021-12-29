class RestError {
  late int status;
  late String message;
  late Map<String, String>? data;

  RestError({required this.status, required this.message, this.data});

  factory RestError.fromJson(Map<String, dynamic> json) => RestError(
        status: int.parse(json['status']),
        message: json['messages'],
        data: parseDataError(json['data']),
      );

  static Map<String, String> parseDataError(json) {
    Map<String, List<String>> dataError = json as Map<String, List<String>>;

    return dataError.map((String key, List<String> value) {
      return MapEntry(key, value.first);
    });
  }
}
