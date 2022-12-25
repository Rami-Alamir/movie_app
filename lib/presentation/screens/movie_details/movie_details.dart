import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/movie_details/cast_list.dart';
import '../../widgets/movie_details/movie_main_details.dart';
import '../../widgets/shared/background.dart';
import '../../widgets/shared/favorite_icon.dart';
import '../../widgets/shared/primary_app_bar.dart';
import '../../widgets/shared/retry.dart';
import '../../../controllers/movie_details_provider.dart';
import '../../../core/constants/constants.dart';
import '../../../core/constants/fixed_assets.dart';
import '../../../core/enum/request_status.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/utils/size_config.dart';

class MovieDetails extends StatefulWidget {
  final int id;
  const MovieDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    final MovieDetailsProvider movieProvider =
        Provider.of<MovieDetailsProvider>(context, listen: false);
    movieProvider.getMoviePageData(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MovieDetailsProvider movieProvider =
        Provider.of<MovieDetailsProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PrimaryAppBar(
        title: '',
        back: true,
        action: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: movieProvider.requestStatus == RequestStatus.completed
                ? FavoriteIcon(movie: movieProvider.movie!)
                : Container(),
          )
        ],
      ),
      body: Background(
          child: movieProvider.requestStatus == RequestStatus.isLoading
              ? Container()
              : movieProvider.requestStatus == RequestStatus.error
                  ? Retry(
                      onPressed: () {
                        movieProvider.getMoviePageData(widget.id, notify: true);
                      },
                    )
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        FadeInImage.assetNetwork(
                            image: Constants.imagesPath +
                                movieProvider.movie!.posterPath!,
                            fit: BoxFit.fill,
                            placeholder: FixedAssets.placeHolder,
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight! / 1.8),
                        const MovieMainDetails(),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15, 0, 0, 15),
                          child:
                              Text('Cast', style: context.textTheme.headline1),
                        ),
                        const CastList()
                      ],
                    )),
    );
  }
}
