import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/models/auth/create_user_req.dart';
import 'package:spotifyclone/data/models/auth/signIn_user.dart';
import 'package:spotifyclone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotifyclone/domain/repositories/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> singIn(SignInUser signInUser)async {
    return  await sl<AuthFirebaseService>().signin(signInUser);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq)async {
   return  await sl<AuthFirebaseService>().signup(createUserReq);
  }

}