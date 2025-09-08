// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/api_module.dart' as _i753;
import 'data/network/fillsa_api.dart' as _i183;
import 'data/network/fillsa_no_token_api.dart' as _i704;
import 'data/repository/HomeRepositoryImpl.dart' as _i104;
import 'domain/repository/home_repository.dart' as _i405;
import 'domain/usecase/get_daily_quote_non_member_usecase.dart' as _i580;
import 'domain/usecase/get_daily_quote_usecase.dart' as _i12;
import 'domain/usecase/post_like_request_usecase.dart' as _i783;
import 'domain/usecase/post_upload_image_usecase.dart' as _i426;
import 'presentation/viewmodels/home_viewmodel.dart' as _i199;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i361.Dio>(() => apiModule.dio());
  gh.lazySingleton<_i183.FillsaApi>(
    () => apiModule.provideFillsaApi(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i704.FillsaNoTokenApi>(
    () => apiModule.provideFillsaNoTokenApi(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i405.HomeRepository>(
    () => _i104.HomeRepositoryImpl(
      gh<_i183.FillsaApi>(),
      gh<_i704.FillsaNoTokenApi>(),
    ),
  );
  gh.lazySingleton<_i783.PostLikeUseCase>(
    () => _i783.PostLikeUseCase(gh<_i405.HomeRepository>()),
  );
  gh.lazySingleton<_i580.GetDailyNonMemberUseCase>(
    () => _i580.GetDailyNonMemberUseCase(gh<_i405.HomeRepository>()),
  );
  gh.lazySingleton<_i12.GetDailyQuoteUseCase>(
    () => _i12.GetDailyQuoteUseCase(gh<_i405.HomeRepository>()),
  );
  gh.lazySingleton<_i426.PostUploadImageUseCase>(
    () => _i426.PostUploadImageUseCase(gh<_i405.HomeRepository>()),
  );
  gh.factory<_i199.HomeViewModel>(
    () => _i199.HomeViewModel(gh<_i580.GetDailyNonMemberUseCase>()),
  );
  return getIt;
}

class _$ApiModule extends _i753.ApiModule {}
