import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/domain/usecases/song/get_play_list.dart';
import 'package:spotifyclone/presentation/home/bloc/play_list_state.dart';

import '../../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedPlayList = await sl<GetPlayListUseCase>().call();

    returnedPlayList.fold((l) {
      print(l.toString());
      emit(PlayListLoadFailure());
    }, (data) {
      print('data is successfully collected');
      emit(PlayListLoaded(songs: data));
    });
  }
}
