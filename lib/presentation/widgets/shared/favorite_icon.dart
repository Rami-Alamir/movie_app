import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/favorites_provider.dart';
import '../../../models/favorite.dart';

class FavoriteIcon extends StatelessWidget {
  final int id;
  const FavoriteIcon({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);
    final bool isFavorite = favoritesProvider.isFavorite(id);
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite_outlined : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.white,
        size: 25,
      ),
      onPressed: () {
        isFavorite
            ? favoritesProvider.removeFromFavorite(Favorite(
                posterPath: 'posterPath',
                releaseDate: 'releaseDate',
                id: id,
                originalTitle: 'originalTitle',
                index: 1))
            : favoritesProvider.addToFavorite(Favorite(
                posterPath: 'posterPath',
                releaseDate: 'releaseDate',
                id: id,
                originalTitle: 'originalTitle',
                index: 1));
      },
    );
  }
}
