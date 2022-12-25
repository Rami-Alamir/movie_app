import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'models/favorite.dart';
import 'core/service/service_locator.dart';
import 'core/utils/providers_list.dart';
import 'presentation/screens/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await Hive.initFlutter();
  Hive.registerAdapter((FavoriteAdapter()));
  await Hive.openBox('MovieFavouriteBox4');

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
      providers: ProvidersList.providersList(), child: const MyApp()));
}
