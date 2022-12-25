import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/bottom_nav/trending_button.dart';
import '../../widgets/shared/background.dart';
import '../../widgets/shared/primary_app_bar.dart';
import '../../widgets/shared/retry.dart';
import '../../widgets/trending/trending_list.dart';
import '../../../presentation/widgets/trending/trending_shimmer_loading.dart';
import '../../../controllers/trending_provider.dart';
import '../../../core/enum/request_status.dart';
import '../../../core/extensions/build_context_extensions.dart';

class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  @override
  void initState() {
    final TrendingProvider trendingProvider =
        Provider.of<TrendingProvider>(context, listen: false);
    trendingProvider.getTrendingMovies();
    trendingProvider.trendingScrollController
        .addListener(trendingProvider.loadMore);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TrendingProvider trendingProvider =
        Provider.of<TrendingProvider>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PrimaryAppBar(
        back: true,
        child: TrendingButton(),
      ),
      body: Background(
        child: trendingProvider.requestStatus == RequestStatus.isLoading
            ? const TrendingShimmerLoading()
            : trendingProvider.requestStatus == RequestStatus.error
                ? Retry(onPressed: () {
                    trendingProvider.setIsLoading();
                    trendingProvider.getTrendingMovies();
                  })
                : ListView(
                    controller: trendingProvider.trendingScrollController,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Trending',
                                style: context.textTheme.headline1),
                          ],
                        ),
                      ),
                      const TrendingList(),
                    ],
                  ),
      ),
    );
  }
}
