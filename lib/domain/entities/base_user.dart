import 'dart:convert';

BaseUser baseUserFromJson(String str) => BaseUser.fromJson(json.decode(str));

String baseUserToJson(BaseUser data) => json.encode(data.toJson());

class BaseUser {
  BaseUser({
    this.name,
    this.email,
    this.phone,
    this.pass,
    this.remember,
  });

  BaseUser.fromJson(dynamic json) {
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    pass = json['pass'] ?? "";
    remember = json['remember'] ?? false;
  }

  String? name;
  String? email;
  String? phone;
  String? pass;
  bool? remember;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['pass'] = pass;
    map['remember'] = remember;
    return map;
  }
}
