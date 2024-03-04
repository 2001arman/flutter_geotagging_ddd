class SignInEntities {
  final String _email;
  final String _password;

  SignInEntities({
    required String email,
    required String password,
  })  : _email = email,
        _password = password;

  String get email => _email;

  String get password => _password;

  @override
  bool operator ==(Object other) {
    return identical(other, this) ||
        (other is SignInEntities && other._email == _email);
  }

  @override
  int get hashCode {
    return runtimeType.hashCode ^ _password.hashCode;
  }
}
