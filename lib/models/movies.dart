import 'results.dart';

class Movies {
  int? page;
  List<Results>? results;
  int? totalPages;

  Movies({this.page, this.results, this.totalPages});

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
  }
}
