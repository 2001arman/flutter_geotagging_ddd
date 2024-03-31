class SignInRequest {
  SignInRequest({
    required this.password,
    required this.email,
  });
  final String email, password;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      SignInRequest(password: json['password'], email: json['email']);

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
