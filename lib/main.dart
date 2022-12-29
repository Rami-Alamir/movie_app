import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  //get intro status
  final prefs = await SharedPreferences.getInstance();
  final bool introStatus = prefs.getBool('intro_status') ?? true;

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiProvider(
      providers: ProvidersList.providersList(),
      child: MyApp(introStatus: introStatus)));
}
