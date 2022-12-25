import 'package:flutter/material.dart';
import '../shared/favorite_icon.dart';
import '../../../models/movie.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/extensions/build_context_extensions.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;
  final double? width;
  const MoviePoster({Key? key, required this.movie, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 10,
          shadowColor: Colors.black,
          color: context.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: width ?? SizeConfig.setWidgetWidth(170, 200, 200),
            height: SizeConfig.setWidgetHeight(230, 250, 250),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                image: Constants.imagesPath + movie.posterPath!,
                fit: BoxFit.fill,
                placeholder: FixedAssets.placeHolder,
              ),
            ), //Padding
          ), //SizedBox
        ),
        Positioned(
            top: 10,
            right: 10,
            child: FavoriteIcon(
              movie: movie,
            )),
      ],
    );
  }
}
