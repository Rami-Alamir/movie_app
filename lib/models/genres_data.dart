import 'genres.dart';

class GenresData {
  List<Genres>? genres;

  GenresData({this.genres});

  GenresData.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
  }
}
