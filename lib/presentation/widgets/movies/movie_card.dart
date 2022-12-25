import 'package:flutter/material.dart';
import '../../../models/results.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/constants/route_constants.dart';

class MovieCard extends StatelessWidget {
  final Results results;
  final bool isUpcoming;
  const MovieCard({Key? key, required this.results, this.isUpcoming = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(routName: movieDetails, arguments: results.id),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            Stack(
              children: [
                Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: context.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    width: SizeConfig.setWidgetWidth(170, 200, 200),
                    height: SizeConfig.setWidgetHeight(230, 250, 250),
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
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
                width: SizeConfig.setWidgetWidth(150, 200, 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(results.originalTitle!,
                        style: context.textTheme.headline3),
                    Row(
                      children: [
                        Text(isUpcoming ? results.releaseDate! : 'Rate: ',
                            style: context.textTheme.headline6!
                                .copyWith(height: 2)),
                        Text(isUpcoming ? '' : "${results.voteAverage!}",
                            style: context.textTheme.headline3!
                                .copyWith(height: 2, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
