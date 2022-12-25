import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PrimaryAppBar(
        title: 'Favorites',
      ),
      body: Background(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return Text(favoritesProvider.favoritesList[i].id.toString());
              },
              itemCount: favoritesProvider.favoritesList.length)),
    );
  }
}
