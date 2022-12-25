import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/movie_details_provider.dart';
import '../../../core/service/service_locator.dart';
import '../../../core/utils/format_helper.dart';
import '../../../core/extensions/build_context_extensions.dart';

class MovieMainDetails extends StatelessWidget {
  const MovieMainDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieDetailsProvider movieProvider =
        Provider.of<MovieDetailsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            movieProvider.movie.title!,
            style: context.textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            movieProvider.movie.overview!,
            style: context.textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Rate: ', style: context.textTheme.headline6),
                  Text(
                      sl<FormatHelper>()
                          .formatDecimal(movieProvider.movie.voteAverage!),
                      style: context.textTheme.headline4),
                ],
              ),
              Row(
                children: [
                  Text('Reviews: ', style: context.textTheme.headline6),
                  Text("${movieProvider.movie.voteCount!}",
                      style: context.textTheme.headline4),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
