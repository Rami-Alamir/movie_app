import '../core/constants/constants.dart';
import '../core/service/networking/api_base_helper.dart';
import '../core/service/service_locator.dart';
import '../models/movies.dart';

class TrendingRepository {
  final ApiBaseHelper _helper = sl<ApiBaseHelper>();

  //get Trending Movies
  Future<Movies> getTrendingMovies({required int page}) async {
    final response = await _helper
        .get("trending/movie/week?api_key=${Constants.apiKey}&page=$page");
    Movies? trending;
    try {
      trending = Movies.fromJson(response);
    } catch (_) {}
    return trending!;
  }
}
