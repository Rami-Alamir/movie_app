import 'package:movie_app/models/cast.dart';
import '../core/constants/constants.dart';
import '../core/service/networking/api_base_helper.dart';
import '../core/service/service_locator.dart';
import '../models/genres_data.dart';
import '../models/movie.dart';
import '../models/movies.dart';

class MoviesRepository {
  final ApiBaseHelper _helper = sl<ApiBaseHelper>();

  //get upcoming movies
  Future<Movies> getUpcoming({required int page}) async {
    final response = await _helper
        .get("movie/upcoming?api_key=${Constants.apiKey}&page=$page");
    Movies? upcoming;
    try {
      upcoming = Movies.fromJson(response);
    } catch (_) {}
    return upcoming!;
  }

  //get now playing movies
  Future<Movies> getNowPlaying({required int page}) async {
    final response = await _helper
        .get("movie/now_playing?api_key=${Constants.apiKey}&page=$page");
    Movies? nowPlaying;
    try {
      nowPlaying = Movies.fromJson(response);
    } catch (_) {}
    return nowPlaying!;
  }

  //get movies
  Future<Movies> getMovies({required int page}) async {
    final response = await _helper
        .get("discover/movie?api_key=${Constants.apiKey}&page=$page");
    Movies? movies;
    try {
      movies = Movies.fromJson(response);
    } catch (_) {}
    return movies!;
  }

  //get movies based on the genres
  Future<Movies> getMoviesByGenres(
      {required int page, required int genres}) async {
    final response = await _helper.get(
        "discover/movie?api_key=${Constants.apiKey}&page=$page&with_genres=$genres");
    Movies? movies;
    try {
      movies = Movies.fromJson(response);
    } catch (_) {}
    return movies!;
  }

  //get Movie Details
  Future<Movie> getMovieDetails({required int id}) async {
    final response = await _helper.get("movie/$id?api_key=${Constants.apiKey}");
    Movie? movie;
    try {
      movie = Movie.fromJson(response);
    } catch (_) {}
    return movie!;
  }

  //get genres list
  Future<GenresData> getGenresList() async {
    final response =
        await _helper.get("genre/movie/list?api_key=${Constants.apiKey}");
    GenresData? genres;
    try {
      genres = GenresData.fromJson(response);
    } catch (_) {}
    return genres!;
  }

  //get cast list
  Future<CastData> getCastList({required int id}) async {
    final response =
        await _helper.get("movie/$id/credits?api_key=${Constants.apiKey}");
    CastData? cast;
    try {
      cast = CastData.fromJson(response);
    } catch (_) {}
    return cast!;
  }
}
