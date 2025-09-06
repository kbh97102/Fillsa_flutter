// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/api_module.dart' as _i164;
import 'package:data/src/network/fillsa_api.dart' as _i264;
import 'package:data/src/network/fillsa_no_token_api.dart' as _i785;
import 'package:data/src/repository/HomeRepositoryImpl.dart' as _i168;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/repository/HomeRepository.dart' as _i943;
import 'package:domain/usecase/ge_daily_quote_usecase.dart' as _i735;
import 'package:domain/usecase/get_daily_quote_non_member_usecase.dart' as _i1;
import 'package:domain/usecase/post_like_request_usecase.dart' as _i1010;
import 'package:domain/usecase/post_upload_image_usecase.dart' as _i839;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:presentation/viewmodels/home_viewmodel.dart' as _i193;

import 'packages/domain/lib/repository/HomeRepository.dart' as _i278;
import 'packages/domain/lib/usecase/ge_daily_quote_usecase.dart' as _i481;
import 'packages/domain/lib/usecase/get_daily_quote_non_member_usecase.dart'
    as _i733;
import 'packages/domain/lib/usecase/post_like_request_usecase.dart' as _i590;
import 'packages/domain/lib/usecase/post_upload_image_usecase.dart' as _i765;
import 'packages/presentation/lib/viewmodels/home_viewmodel.dart' as _i151;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.lazySingleton<_i361.Dio>(() => apiModule.dio());
  gh.lazySingleton<_i264.FillsaApi>(
    () => apiModule.provideFillsaApi(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i785.FillsaNoTokenApi>(
    () => apiModule.provideFillsaNoTokenApi(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i590.PostLikeUseCase>(
    () => _i590.PostLikeUseCase(gh<_i278.HomeRepository>()),
  );
  gh.lazySingleton<_i481.GetDailyQuoteUseCase>(
    () => _i481.GetDailyQuoteUseCase(gh<_i278.HomeRepository>()),
  );
  gh.lazySingleton<_i733.GetDailyNonMemberUseCase>(
    () => _i733.GetDailyNonMemberUseCase(gh<_i278.HomeRepository>()),
  );
  gh.lazySingleton<_i765.PostUploadImageUseCase>(
    () => _i765.PostUploadImageUseCase(gh<_i278.HomeRepository>()),
  );
  gh.lazySingleton<_i943.HomeRepository>(
    () => _i168.HomeRepositoryImpl(
      gh<_i264.FillsaApi>(),
      gh<_i785.FillsaNoTokenApi>(),
    ),
  );
  gh.lazySingleton<_i839.PostUploadImageUseCase>(
    () => _i839.PostUploadImageUseCase(gh<_i943.HomeRepository>()),
  );
  gh.lazySingleton<_i735.GetDailyQuoteUseCase>(
    () => _i735.GetDailyQuoteUseCase(gh<_i943.HomeRepository>()),
  );
  gh.lazySingleton<_i1.GetDailyNonMemberUseCase>(
    () => _i1.GetDailyNonMemberUseCase(gh<_i943.HomeRepository>()),
  );
  gh.lazySingleton<_i1010.PostLikeUseCase>(
    () => _i1010.PostLikeUseCase(gh<_i943.HomeRepository>()),
  );
  gh.factory<_i193.HomeViewModel>(
    () => _i193.HomeViewModel(gh<_i1.GetDailyNonMemberUseCase>()),
  );
  gh.factory<_i151.HomeViewModel>(
    () => _i151.HomeViewModel(gh<_i1.GetDailyNonMemberUseCase>()),
  );
  return getIt;
}

class _$ApiModule extends _i164.ApiModule {}
