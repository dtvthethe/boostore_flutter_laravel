class UserData {
  late String displayName;
  late String? avatar;
  late String token;

  UserData({required this.displayName, required this.token, this.avatar});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        displayName: json['display_name'].toString(),
        token: json['access_token'].toString(),
        avatar: json['avatar'].toString(),
      );
}
