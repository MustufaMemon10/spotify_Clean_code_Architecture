import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotifyclone/domain/entities/song/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String ? songId;

  SongModel(
      {required this.title,
        required this.artist,
        required this.duration,
        required this.releaseDate,
        required this.isFavorite,
        required this.songId
        });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'] as String?;
    artist = data['artist'] as String?;
    duration = data['duration'] is num
        ? data['duration'] as num
        : num.tryParse(data['duration'] as String? ?? '') ?? 0;
    releaseDate = data['releaseDate'] as Timestamp?;
  }
}


extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!,
        isFavorite: isFavorite!,
        songId: songId!,
        );
  }
}
