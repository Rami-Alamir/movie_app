import 'package:flutter/material.dart';
import '../../../models/cast.dart';
import '../../../core/constants/constants.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/constants/fixed_assets.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
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
                child: cast.profilePath != null
                    ? FadeInImage.assetNetwork(
                        image: Constants.imagesPath + cast.profilePath!,
                        fit: BoxFit.fill,
                        placeholder: FixedAssets.placeHolder,
                      )
                    : Image.asset(
                        cast.gender == 1
                            ? FixedAssets.female
                            : FixedAssets.male,
                        fit: BoxFit.fill,
                      ),
              ), //Padding
            ), //SizedBox
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              width: SizeConfig.setWidgetWidth(150, 200, 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${cast.name}", style: context.textTheme.headline3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
