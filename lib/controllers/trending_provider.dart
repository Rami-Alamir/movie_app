import 'package:flutter/material.dart';
import '../core/enum/request_status.dart';
import '../core/service/service_locator.dart';
import '../models/movies.dart';
import '../repository/trending_repository.dart';

class TrendingProvider with ChangeNotifier {
  RequestStatus _requestStatus = RequestStatus.isLoading;
  final ScrollController trendingScrollController = ScrollController();
  Movies? _trending;
  int _trendingPage = 1;

  RequestStatus get requestStatus => _requestStatus;
  Movies? get trending => _trending;

  //get trending movies
  Future<void> getTrendingMovies({int page = 1}) async {
    _trendingPage = page;
    try {
      _requestStatus = RequestStatus.isLoading;
      Movies? trendingData;
      trendingData =
          await sl<TrendingRepository>().getTrendingMovies(page: _trendingPage);
      if (_trendingPage == 1) {
        _trending = trendingData;
      } else {
        _trending!.results = [_trending!.results, trendingData.results!]
            .expand((x) => x!)
            .toList();
      }
      _requestStatus = RequestStatus.completed;
    } catch (_) {
      _requestStatus = RequestStatus.error;
    }
    notifyListeners();
  }

  void setIsLoading() {
    _requestStatus = RequestStatus.isLoading;
    notifyListeners();
  }

  //load more (pagination)
  loadMore() async {
    if ((trendingScrollController.position.pixels ==
            trendingScrollController.position.maxScrollExtent) &&
        ((_trending?.totalPages ?? 1) > _trendingPage) &&
        _requestStatus != RequestStatus.isLoading) {
      print('_trendingPage $_trendingPage');

      _trendingPage += 1;
      try {
        await getTrendingMovies(page: _trendingPage);
      } catch (_) {
        if (_trendingPage != 1) {
          _trendingPage -= 1;
        }
      }
    }
  }
}
