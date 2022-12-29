import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/movies/logo.dart';
import '../../widgets/movies/genres_list.dart';
import '../../widgets/movies/movies_list.dart';
import '../../widgets/movies/shimmer/movies_shimmer_loading.dart';
import '../../widgets/movies/now_playing_slider.dart';
import '../../widgets/shared/background.dart';
import '../../widgets/shared/primary_app_bar.dart';
import '../../widgets/shared/retry.dart';
import '../../../controllers/movies_provider.dart';
import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/enum/request_status.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  void initState() {
    final MoviesProvider moviesProvider =
        Provider.of<MoviesProvider>(context, listen: false);
    moviesProvider.getMoviesPageData(notify: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const PrimaryAppBar(
          child: Logo(),
        ),
        body: Background(
          child: moviesProvider.requestStatus == RequestStatus.isLoading
              ? const MoviesShimmerLoading()
              : moviesProvider.requestStatus == RequestStatus.error
                  ? Retry(
                      onPressed: () {
                        moviesProvider.getMoviesPageData(notify: true);
                      },
                    )
                  : ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 20, 0, 30),
                          child: Text('Now Playing',
                              style: context.textTheme.headline1),
                        ),
                        const NowPlayingSlider(),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 0, 20),
                          child: Text('Upcoming',
                              style: context.textTheme.headline1),
                        ),
                        MoviesList(
                          isUpcoming: true,
                          controller: moviesProvider.upcomingScrollController,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 8, 0, 10),
                          child: Text('Movies',
                              style: context.textTheme.headline1),
                        ),
                        const GenresList(),
                        MoviesList(
                          controller: moviesProvider.moviesScrollController,
                        ),
                      ],
                    ),
        ));
  }
}
