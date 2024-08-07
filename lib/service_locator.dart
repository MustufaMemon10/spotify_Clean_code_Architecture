import 'package:get_it/get_it.dart';
import 'package:spotifyclone/data/repository/auth/auth_repository_%20impl.dart';
import 'package:spotifyclone/data/repository/song/song.dart';
import 'package:spotifyclone/domain/repositories/auth/auth.dart';
import 'package:spotifyclone/domain/repositories/song/song.dart';
import 'package:spotifyclone/domain/usecases/auth/get_favorite_songs.dart';
import 'package:spotifyclone/domain/usecases/auth/get_user.dart';
import 'package:spotifyclone/domain/usecases/auth/signin.dart';
import 'package:spotifyclone/domain/usecases/auth/signup.dart';
import 'package:spotifyclone/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotifyclone/domain/usecases/song/get_news_songs.dart';
import 'package:spotifyclone/domain/usecases/song/is_favorite_song.dart';

import 'data/sources/auth/auth_firebase_service.dart';
import 'data/sources/song/song_firebase_service.dart';
import 'domain/usecases/song/get_play_list.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
 
 
 sl.registerSingleton<AuthFirebaseService>(
  AuthFirebaseServiceImpl()
 );

 sl.registerSingleton<SongFirebaseService>(
     SongFirebaseServiceImpl()
 );

 sl.registerSingleton<AuthRepository>(
  AuthRepositoryImpl()
 );

 sl.registerSingleton<SongRepository>(
     SongRepositoryImpl()
 );

 sl.registerSingleton<SignupUseCase>(
  SignupUseCase()
 );

 sl.registerSingleton<SignInUseCase>(
  SignInUseCase()
 );

 sl.registerSingleton<GetNewsSongsUseCase>(
     GetNewsSongsUseCase()
 );
 sl.registerSingleton<GetPlayListUseCase>(
  GetPlayListUseCase()
 );
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
  AddOrRemoveFavoriteSongUseCase()
 );
   sl.registerSingleton<IsFavoriteSongUseCase>(
  IsFavoriteSongUseCase()
 );
   sl.registerSingleton<GetUserUseCase>(
  GetUserUseCase()
 );

   sl.registerSingleton<GetUserFavoriteSongsUseCase>(
  GetUserFavoriteSongsUseCase()
 );
}