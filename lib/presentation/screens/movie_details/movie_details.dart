import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/movie_details/cast_list.dart';
import '../../widgets/movie_details/movie_details_shimmer.dart';
import '../../widgets/movie_details/movie_image.dart';
import '../../widgets/movie_details/movie_main_details.dart';
import '../../widgets/shared/background.dart';
import '../../widgets/shared/favorite_icon.dart';
import '../../widgets/shared/primary_app_bar.dart';
import '../../widgets/shared/retry.dart';
import '../../../controllers/movie_details_provider.dart';
import '../../../core/enum/request_status.dart';

class MovieDetails extends StatefulWidget {
  final int id;

  const MovieDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> animationOffset;
  late final Animation<Offset> animationOffset2;
  late final AnimationController animationController;

  @override
  void initState() {
    final MovieDetailsProvider movieProvider =
        Provider.of<MovieDetailsProvider>(context, listen: false);
    movieProvider.getMoviePageData(widget.id);
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animationOffset = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(
        0.0,
        -10.0,
      ),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linearToEaseOut,
    ));
    animationOffset2 = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(-30.0, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linearToEaseOut,
    ));
    animationController.forward();
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
            ? const MovieDetailsShimmerLoading()
            : movieProvider.requestStatus == RequestStatus.error
                ? Retry(
                    onPressed: () {
                      movieProvider.getMoviePageData(widget.id, notify: true);
                    },
                  )
                : ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      MovieImage(
                        imagePath: movieProvider.movie!.posterPath!,
                        animationOffset: animationOffset,
                      ),
                      MovieMainDetails(
                        animationOffset: animationOffset2,
                      ),
                      CastList(
                        animationOffset: animationOffset2,
                      )
                    ],
                  ),
      ),
    );
  }
}
