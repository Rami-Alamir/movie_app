import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../presentation/widgets/favorites/favorite_card.dart';
import '../../../controllers/favorites_provider.dart';
import '../../../core/utils/size_config.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoritesProvider favoritesProvider =
        Provider.of<FavoritesProvider>(context);

    return SizedBox(
      height: SizeConfig.screenHeight,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: SizeConfig.screenWidth! ~/ 160,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              mainAxisExtent: 260),
          padding:
              const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 220),
          itemCount: favoritesProvider.favoritesList.length,
          itemBuilder: (BuildContext ctx, index) {
            return FavoriteCard(
              movie: favoritesProvider.favoritesList[index],
              width:
                  SizeConfig.screenWidth! / (SizeConfig.screenWidth! ~/ 160) -
                      30,
            );
          }),
    );
  }
}
