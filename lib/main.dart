import 'package:diamonds/domain/firebase_service.dart';
import 'package:diamonds/domain/hive_service.dart';
import 'package:diamonds/presentation/controllers/search_screen_controller.dart';
import 'package:diamonds/presentation/screens/search/search_screen.dart';
import 'package:diamonds/presentation/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'data/sources/local/preferences_storage.dart';
import 'injector.dart';
import 'firebase_options.dart';

void main() async {
  configureDependencies();
  await Hive.initFlutter();
  await PreferencesStorage().init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppTheme.primaryColor,
    systemNavigationBarColor: AppTheme.primaryColor,
  ));
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SearchScreenController(getIt<FirebaseService>(), getIt<HiveService>())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diamonds App',
      theme: AppTheme.theme(context),
      home: const SearchScreen(),
    );
  }
}
