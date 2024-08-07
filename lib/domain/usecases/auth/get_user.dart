import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/configs/usercase/usecase.dart';
import 'package:spotifyclone/domain/repositories/auth/auth.dart';
import 'package:spotifyclone/service_locator.dart';

class GetUserUseCase implements UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getUser();
  }
  

}