class LoginResponse {
  final UserInfo? userInfo;

  LoginResponse({this.userInfo});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      userInfo:
          json['userInfo'] != null ? UserInfo.fromJson(json['userInfo']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userInfo': userInfo?.toJson()};
  }
}

class UserInfo {
  final String token;
  final String username;

  UserInfo({required this.token, required this.username});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      token: json['token'] ?? '',
      username: json['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'username': username};
  }
}
