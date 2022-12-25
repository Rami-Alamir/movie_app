import 'movie.dart';

class Movies {
  int? page;
  List<Movie>? movie;
  int? totalPages;

  Movies({this.page, this.movie, this.totalPages});

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      movie = <Movie>[];
      json['results'].forEach((v) {
        movie!.add(Movie.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
  }
}
