import 'package:spotifyclone/core/configs/usercase/usecase.dart';

import '../../../service_locator.dart';
import '../../repositories/song/song.dart';

class IsFavoriteSongUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params})async {
   return await sl<SongRepository>().isFavoriteSong(params!);
  }
  
  
}
