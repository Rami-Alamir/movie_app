import 'package:flutter/material.dart';
import '../../../models/movie.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/constants/route_constants.dart';

class NowPlayingCard extends StatelessWidget {
  final Movie movie;
  const NowPlayingCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(routName: movieDetails, arguments: movie.id),
      child: Column(
        children: [
          Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: context.colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: SizeConfig.setWidgetWidth(250, 400, 400),
              height: SizeConfig.setWidgetHeight(380, 500, 500),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: SizedBox(
              width: SizeConfig.setWidgetWidth(230, 380, 380),
              child: Text(movie.originalTitle!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("${movie.voteAverage!}",
                      style: context.textTheme.headline4),
                  Text('Rate', style: context.textTheme.headline6),
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Text("${movie.voteCount!}",
                      style: context.textTheme.headline4),
                  Text('Vote count', style: context.textTheme.headline6),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
