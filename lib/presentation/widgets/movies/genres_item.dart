import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/movies_provider.dart';
import '../../../core/extensions/build_context_extensions.dart';

class GenresItem extends StatelessWidget {
  final int id;
  final String name;

  const GenresItem({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MoviesProvider moviesProvider = Provider.of<MoviesProvider>(context);
    final bool isSelected = id == moviesProvider.selectedGenres;
    return InkWell(
      onTap: () {
        moviesProvider.getMoviesByGenresAndUpdate(id);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
            constraints: const BoxConstraints(minHeight: 40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: isSelected
                      ? [
                          context.colorScheme.secondary,
                          context.colorScheme.secondaryContainer,
                        ]
                      : [
                          context.colorScheme.primaryContainer
                              .withOpacity(0.65),
                          context.colorScheme.primaryContainer.withOpacity(0.5),
                        ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.mirror),
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,
                      textAlign: TextAlign.center,
                      style: context.textTheme.headline5?.copyWith(
                        height: 2,
                        color: isSelected
                            ? context.colorScheme.primaryContainer
                            : context.colorScheme.primary,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
