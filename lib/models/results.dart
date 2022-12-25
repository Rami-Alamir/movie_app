class Results {
  String? posterPath;
  String? overview;
  String? releaseDate;
  int? id;
  String? originalTitle;
  double? popularity;
  int? voteCount;
  double? voteAverage;

  Results(
      {this.posterPath,
      this.overview,
      this.releaseDate,
      this.id,
      this.originalTitle,
      this.popularity,
      this.voteCount,
      this.voteAverage});

  Results.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    id = json['id'];
    originalTitle = json['original_title'];
    popularity = json['popularity'] * 1.0;
    voteCount = json['vote_count'];
    voteAverage = json['vote_average'] * 1.0;
  }
}
