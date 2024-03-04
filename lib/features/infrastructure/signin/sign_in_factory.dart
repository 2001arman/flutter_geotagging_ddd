import 'package:geotagging/features/domain/sign_in/entities/sign_in.dart';
import 'package:geotagging/features/domain/sign_in/interface/sign_in_factory_base.dart';

class SignInFactory implements SignInFactoryBase {
  @override
  SignInEntities create({required String email, required String password}) {
    return SignInEntities(email: email, password: password);
  }
}
