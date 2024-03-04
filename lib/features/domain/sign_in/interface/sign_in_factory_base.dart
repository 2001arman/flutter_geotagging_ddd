import 'package:geotagging/features/domain/sign_in/entities/sign_in.dart';

abstract class SignInFactoryBase {
  SignInEntities create({
    required String email,
    required String password,
  });
}
