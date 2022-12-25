import 'package:get_it/get_it.dart';
import 'networking/api_base_helper.dart';
import '../utils/format_helper.dart';
import '../utils/size_config.dart';
import '../../repository/trending_repository.dart';
import '../../repository/movies_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton(() => ApiBaseHelper());
    sl.registerLazySingleton(() => TrendingRepository());
    sl.registerLazySingleton(() => SizeConfig());
    sl.registerLazySingleton(() => MoviesRepository());
    sl.registerLazySingleton(() => FormatHelper());
  }
}
