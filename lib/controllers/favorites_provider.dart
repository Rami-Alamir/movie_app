import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/favorite.dart';
import '../core/enum/request_status.dart';

class FavoritesProvider with ChangeNotifier {
  final RequestStatus _requestStatus = RequestStatus.isLoading;
  dynamic box;
  List<Favorite> favoritesList = [];
  RequestStatus get requestStatus => _requestStatus;

  Future<void> openHiveBox() async {
    box = await Hive.openBox('MovieFavouriteBox4');
    getFavorites();
  }

  //get favorites
  void getFavorites() async {
    List keys = box.keys.toList();
    for (int i = 0; i < (box.length ?? 0); i++) {
      Favorite favorite = box.getAt(i)..index = keys[i];
      favoritesList.add(favorite);
    }
  }

  // add item to favourite list and save in local db
  Future<void> addToFavorite(Favorite favorite) async {
    try {
      box.add(favorite);
      favoritesList.add(favorite);
      notifyListeners();
    } catch (_) {}
  }

  // remove item from favourite list and local db
  Future<void> removeFromFavorite(Favorite favorite) async {
    try {
      for (int i = 0; i < favoritesList.length; i++) {
        if (favoritesList[i].id == favorite.id) {
          box?.delete(favoritesList[i].index);
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
