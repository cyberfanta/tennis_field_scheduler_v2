import 'dart:convert';

import 'package:equatable/equatable.dart';

BaseUser baseUserFromJson(String str) =>
    const BaseUser(name: '', email: '', phone: '', pass: '', remember: false)
        .fromJson(json.decode(str));

String baseUserToJson(BaseUser data) => json.encode(data.toJson());

class BaseUser extends Equatable {
  final String name;
  final String email;
  final String phone;
  final String pass;
  final bool remember;

  const BaseUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.pass,
    required this.remember,
  });

  BaseUser fromJson(dynamic json) {
    return BaseUser(
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      pass: json['pass'] ?? "",
      remember: json['remember'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['pass'] = pass;
    map['remember'] = remember;
    return map;
  }

  @override
  List<Object?> get props => [name, email, phone, pass, remember];
}
