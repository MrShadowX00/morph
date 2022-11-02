class SocialFacebookProvider {
  SocialFacebookProvider({
    required this.authToken,
  });

  String authToken;

  Map<String, dynamic> toJson() => {
        "auth_token": authToken,
      };
}
