import 'package:flutter/material.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            FixedAssets.favorite,
            width: 200,
            height: 200,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Text(
              'Favorite is empty',
              style: context.textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
