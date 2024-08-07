import 'package:dartz/dartz.dart';
import 'package:spotifyclone/data/models/auth/create_user_req.dart';
import 'package:spotifyclone/data/models/auth/signIn_user.dart';

abstract class AuthRepository {


  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signIn(SignInUser signInUser);
  Future<Either> getUser();
}