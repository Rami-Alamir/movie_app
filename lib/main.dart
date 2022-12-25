import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'core/service/service_locator.dart';
import 'core/utils/providers_list.dart';
import 'models/movie.dart';
import 'presentation/screens/app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await Hive.initFlutter();
  Hive.registerAdapter((MovieAdapter()));
  await Hive.openBox('MovieFavourites');

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
      providers: ProvidersList.providersList(), child: const MyApp()));
}
