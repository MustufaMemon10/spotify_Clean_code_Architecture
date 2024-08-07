import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/domain/usecases/song/get_news_songs.dart';
import 'package:spotifyclone/presentation/home/bloc/news_songs_state.dart';

import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit(): super (NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        print(l.toString());
      emit(NewsSongsLoadFailure());
    }, 
    (data) {
        print('data is successfully collected');
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
