import 'package:flutter/material.dart';
import '../models/cast.dart';
import '../models/movie.dart';
import '../core/enum/request_status.dart';
import '../core/service/service_locator.dart';
import '../repository/movies_repository.dart';

class MovieDetailsProvider with ChangeNotifier {
  RequestStatus _requestStatus = RequestStatus.isLoading;
  Movie? _movie;
  CastData? _cast;

  RequestStatus get requestStatus => _requestStatus;
  Movie? get movie => _movie;
  CastData? get cast => _cast;

  //init Movie page
  Future<void> getMoviePageData(int movieId, {bool notify = false}) async {
    try {
      _requestStatus = RequestStatus.isLoading;
      if (notify) {
        notifyListeners();
      }
      await Future.wait([
        _getMovieDetails(movieId),
        _getCast(movieId),
      ]);
      _requestStatus = RequestStatus.completed;
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
    notifyListeners();
  }

  //get movie details
  Future<void> _getMovieDetails(int id) async {
    try {
      _movie = await sl<MoviesRepository>().getMovieDetails(id: id);
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
  }

  //get cast
  Future<void> _getCast(int id) async {
    try {
      _cast = await sl<MoviesRepository>().getCastList(id: id);
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
  }
}
