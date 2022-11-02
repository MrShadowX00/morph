// To parse this JSON data, do
//
//     final fullSignUpProvider = fullSignUpProviderFromJson(jsonString);

import 'dart:convert';

FullSignUpProvider fullSignUpProviderFromJson(String str) => FullSignUpProvider.fromJson(json.decode(str));

String fullSignUpProviderToJson(FullSignUpProvider data) => json.encode(data.toJson());

class FullSignUpProvider {
  FullSignUpProvider({
    required this.secret,
    required this.fullName,
    required this.bio,
    required this.birthDate,
    required this.sex,
    required this.email,
    required this.password,
  });

  String secret;
  String fullName;
  String bio;
  String birthDate;
  String sex;
  String email;
  String password;

  factory FullSignUpProvider.fromJson(Map<String, dynamic> json) => FullSignUpProvider(
    secret: json["secret"],
    fullName: json["full_name"],
    bio: json["bio"],
    birthDate: json["birth_date"],
    sex: json["sex"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "secret": secret,
    "full_name": fullName,
    "bio": bio,
    "birth_date": birthDate,
    "sex": sex,
    "email": email,
    "password": password,
  };
}
