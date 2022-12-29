import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/favorites/empty_list.dart';
import '../../widgets/favorites/favorite_list.dart';
import '../../widgets/shared/background.dart';
import '../../widgets/shared/primary_app_bar.dart';
import '../../../controllers/favorites_provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  void initState() {
    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context, listen: false);
    favoritesProvider.openHiveBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PrimaryAppBar(
        title: 'Favorites',
      ),
      body: Background(
          child: favoritesProvider.favoritesList.isNotEmpty
              ? ListView(
                  children: const [
                    FavoritesList(),
                  ],
                )
              : const EmptyList()),
    );
  }
}
