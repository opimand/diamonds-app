// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:diamonds/data/repository/firebase_repository.dart' as _i5;
import 'package:diamonds/data/repository/hive_repository.dart' as _i7;
import 'package:diamonds/data/sources/local/preferences_storage.dart' as _i3;
import 'package:diamonds/data/sources/remote/remote_data_source.dart' as _i4;
import 'package:diamonds/domain/firebase_service.dart' as _i6;
import 'package:diamonds/domain/hive_service.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.PreferencesStorage>(() => _i3.PreferencesStorage());
    gh.lazySingleton<_i4.RemoteDataSource>(() => _i4.RemoteDataSource());
    gh.lazySingleton<_i5.FirebaseRepository>(
        () => _i5.FirebaseRepository(gh<_i4.RemoteDataSource>()));
    gh.lazySingleton<_i6.FirebaseService>(
        () => _i6.FirebaseService(gh<_i5.FirebaseRepository>()));
    gh.lazySingleton<_i7.HiveRepository>(
        () => _i7.HiveRepository(gh<_i3.PreferencesStorage>()));
    gh.lazySingleton<_i8.HiveService>(
        () => _i8.HiveService(gh<_i7.HiveRepository>()));
    return this;
  }
}
