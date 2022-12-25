import 'package:flutter/material.dart';
import '../../../models/results.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/constants/route_constants.dart';

class NowPlayingCard extends StatelessWidget {
  final Results results;
  const NowPlayingCard({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(routName: movieDetails, arguments: results.id),
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
              height: SizeConfig.setWidgetHeight(380, 520, 520),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  image: Constants.imagesPath + results.posterPath!,
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
              child: Text(results.originalTitle!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.headline1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("${results.voteAverage!}",
                      style: context.textTheme.headline4),
                  Text('Rate', style: context.textTheme.headline6),
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Text("${results.voteAverage!}",
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
