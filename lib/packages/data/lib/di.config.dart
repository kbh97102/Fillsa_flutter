// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/api_module.dart' as _i709;
import 'package:data/network/fillsa_api.dart' as _i158;
import 'package:data/repository/HomeRepositoryImpl.dart' as _i117;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiModule = _$ApiModule();
    gh.lazySingleton<_i361.Dio>(() => apiModule.dio());
    gh.lazySingleton<_i158.FillsaApi>(
      () => apiModule.fillsaApi(gh<_i361.Dio>()),
    );
    gh.factory<_i117.HomeRepositoryImpl>(
      () => _i117.HomeRepositoryImpl(gh<_i158.FillsaApi>()),
    );
    return this;
  }
}

class _$ApiModule extends _i709.ApiModule {}
