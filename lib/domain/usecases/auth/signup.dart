import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/configs/usercase/usecase.dart';
import 'package:spotifyclone/data/models/auth/create_user_req.dart';
import 'package:spotifyclone/domain/repositories/auth/auth.dart';
import 'package:spotifyclone/service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUserReq>{
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }

}