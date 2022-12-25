import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie extends HiveObject {
  @HiveField(0)
  String? backdropPath;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? originalTitle;
  @HiveField(3)
  String? overview;
  @HiveField(4)
  String? posterPath;
  @HiveField(5)
  String? releaseDate;
  @HiveField(6)
  double? voteAverage;
  @HiveField(7)
  int? index;
  @HiveField(8)
  int? voteCount;

  Movie(
      {this.backdropPath,
      this.id,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.voteAverage,
      this.index,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    voteAverage = json['vote_average'] * 1.0;
    voteCount = json['vote_count'];
    index = 1;
  }
}
