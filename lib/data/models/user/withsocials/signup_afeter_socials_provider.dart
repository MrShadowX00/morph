
class SignUpAfterSocialsProvider {
  SignUpAfterSocialsProvider({
    required this.secret,
    required this.fullName,
    required this.bio,
    required this.birthDate,
    required this.sex,
    required this.phone,
  });

  String secret;
  String fullName;
  String bio;
  String birthDate;
  String sex;
  String phone;

  Map<String, dynamic> toJson() => {
    "secret": secret,
    "full_name": fullName,
    "bio": bio,
    "birth_date": birthDate,
    "sex": sex,
    "phone": phone,
  };
}
