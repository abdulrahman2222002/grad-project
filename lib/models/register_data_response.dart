

class RegisterDataResponse {
  String? message;
  User? user;
  String? token;

  RegisterDataResponse({this.message, this.user, this.token});

  RegisterDataResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    if (user != null) {
      _data["user"] = user?.toJson();
    }
    _data["token"] = token;
    return _data;
  }
}

class User {
  String? name;
  String? email;
  String? password;
  bool? blocked;
  bool? isActive;
  bool? confirmEmail;
  String? role;
  dynamic forgetCode;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  int? v;

  User(
      {this.name,
      this.email,
      this.password,
      this.blocked,
      this.isActive,
      this.confirmEmail,
      this.role,
      this.forgetCode,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.v});

  User.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    password = json["password"];
    blocked = json["blocked"];
    isActive = json["isActive"];
    confirmEmail = json["confirmEmail"];
    role = json["role"];
    forgetCode = json["forgetCode"];
    id = json["_id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    firstName = json["firstName"];
    v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["password"] = password;
    _data["blocked"] = blocked;
    _data["isActive"] = isActive;
    _data["confirmEmail"] = confirmEmail;
    _data["role"] = role;
    _data["forgetCode"] = forgetCode;
    _data["_id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["firstName"] = firstName;
    _data["__v"] = v;
    return _data;
  }
}
