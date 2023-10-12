import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:diamonds/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  generateForDir: [
    'lib/data',
    'lib/domain',
    'lib/device',
  ],
)
void configureDependencies() => getIt.init();
