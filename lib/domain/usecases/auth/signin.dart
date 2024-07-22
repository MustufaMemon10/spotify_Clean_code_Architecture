import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/configs/usercase/usecase.dart';
import 'package:spotifyclone/data/models/auth/signIn_user.dart';
import 'package:spotifyclone/domain/repositories/auth/auth.dart';
import 'package:spotifyclone/service_locator.dart';

class SignInUseCase implements UseCase<Either,SignInUser>{
  @override
  Future<Either> call({SignInUser? params}) {
    return sl<AuthRepository>().signIn(params!);
  }

}