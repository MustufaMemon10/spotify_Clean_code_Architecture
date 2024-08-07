import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/configs/usercase/usecase.dart';

import '../../../service_locator.dart';
import '../../repositories/song/song.dart';

class AddOrRemoveFavoriteSongUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params})async {
   return await sl<SongRepository>().addOrRemoveFavoriteSongs(params!);
  }
  
  
}
