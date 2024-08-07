import 'package:dartz/dartz.dart';
import 'package:spotifyclone/core/configs/usercase/usecase.dart';
import 'package:spotifyclone/data/repository/song/song.dart';

import '../../../service_locator.dart';
import '../../repositories/song/song.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getNewsSongs();
  }
}
