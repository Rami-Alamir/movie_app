import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/movie.dart';
import '../core/enum/request_status.dart';

class FavoritesProvider with ChangeNotifier {
  final RequestStatus _requestStatus = RequestStatus.isLoading;
  dynamic box;
  List<Movie> favoritesList = [];

  RequestStatus get requestStatus => _requestStatus;

  // open hive box
  Future<void> openHiveBox() async {
    box = await Hive.openBox('MovieFavourites');
    getFavorites();
  }

  //get favorites list
  void getFavorites() async {
    for (int i = 0; i < (box.length ?? 0); i++) {
      favoritesList.add(box.getAt(i));
    }
    notifyListeners();
  }

  // add item to favourite list and save in local db (hive)
  Future<void> addToFavorite(Movie favorite) async {
    try {
      box.add(favorite);
      favoritesList.add(favorite);
      notifyListeners();
    } catch (_) {}
  }

  // remove item from favourite list and local db (hive)
  Future<void> removeFromFavorite(Movie favorite) async {
    try {
      for (int i = 0; i < favoritesList.length; i++) {
        if (favoritesList[i].id == favorite.id) {
          favoritesList[i].delete();
          favoritesList.removeAt(i);
          notifyListeners();
          return;
        }
      }
    } catch (_) {}
  }

  //return isFavorite status
  bool isFavorite(int id) {
    return favoritesList.where((item) => item.id == id).isNotEmpty;
  }
}
