import 'package:flutter/material.dart';
import 'package:movie_app/presentation/widgets/shared/favorite_icon.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/service/service_locator.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/format_helper.dart';
import '../../../models/results.dart';

class TrendingCard extends StatelessWidget {
  final Results results;

  const TrendingCard({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(routName: movieDetails, arguments: results.id),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 50,
        shadowColor: Colors.black,
        color: context.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight! * 0.58,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  image: Constants.imagesPath + results.posterPath!,
                  fit: BoxFit.fill,
                  placeholder: FixedAssets.placeHolder,
                ),
              ), //Padding
            ),
            Positioned(
                top: 20,
                right: 20,
                child: FavoriteIcon(
                  id: results.id!,
                )),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: .5, color: Colors.white70)),
                child: Container(
                  margin: const EdgeInsets.all(3), //
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // inner circle color
                  ),
                  child: Center(
                      child: Text(
                    sl<FormatHelper>().formatDecimal(results.voteAverage!),
                    style: context.textTheme.subtitle2,
                  )), // inner content
                ),
              ),
            ),
          ],
        ), //SizedBox
      ),
    );
  }
}
