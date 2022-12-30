import 'package:flutter/material.dart';
import '../core/enum/request_status.dart';
import '../core/service/service_locator.dart';
import '../models/genres_data.dart';
import '../models/movies.dart';
import '../repository/movies_repository.dart';

class MoviesProvider with ChangeNotifier {
  RequestStatus _requestStatus = RequestStatus.isLoading;
  int _selectedGenres = 0;
  late Movies _movies;
  late Movies _upcoming;
  late Movies _nowPlaying;
  late GenresData _genresList;
  final ScrollController upcomingScrollController = ScrollController();
  final ScrollController moviesScrollController = ScrollController();
  RequestStatus get requestStatus => _requestStatus;
  Movies get upcoming => _upcoming;
  Movies get nowPlaying => _nowPlaying;
  Movies get movies => _movies;
  GenresData get genresList => _genresList;
  int get selectedGenres => _selectedGenres;

  //get movies by genres and update
  Future<void> getMoviesByGenresAndUpdate(int selectedGenres) async {
    _selectedGenres = selectedGenres;
    notifyListeners();
    try {
      if (_selectedGenres == 0) {
        await _getMovies();
      } else {
        await _getMoviesByGenres();
      }
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
    notifyListeners();
  }

  //get all movies
  Future<void> _getMovies() async {
    try {
      _movies = await sl<MoviesRepository>().getMovies(page: 1);
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
  }

  //get movies by genres
  Future<void> _getMoviesByGenres() async {
    try {
      _movies = await sl<MoviesRepository>()
          .getMoviesByGenres(page: 1, genres: _selectedGenres);
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
  }

  //get genres list
  Future<void> _getGenresList() async {
    try {
      _genresList = await sl<MoviesRepository>().getGenresList();
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
  }

  //get now playing movies
  Future<void> _getNowPlaying() async {
    try {
      _nowPlaying = await sl<MoviesRepository>().getNowPlaying(page: 1);
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
  }

  //get upcoming movies
  Future<void> _getUpcoming() async {
    try {
      _upcoming = await sl<MoviesRepository>().getUpcoming(page: 1);
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
  }

  //init Movies page
  Future<void> getMoviesPageData({bool notify = true}) async {
    _requestStatus = RequestStatus.isLoading;
    try {
      if (notify) {
        notifyListeners();
      }
      await Future.wait([
        _getMovies(),
        _getNowPlaying(),
        _getUpcoming(),
        _getGenresList(),
      ]);
      _requestStatus = RequestStatus.completed;
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
    notifyListeners();
  }
}
