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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'data/api_module.dart' as _i753;
import 'data/local/local_database.dart' as _i17;
import 'data/network/fillsa_api.dart' as _i183;
import 'data/network/fillsa_no_token_api.dart' as _i704;
import 'data/repository/HomeRepositoryImpl.dart' as _i104;
import 'data/repository/local_repository_impl.dart' as _i239;
import 'data/repository/login_repository_impl.dart' as _i371;
import 'domain/model/response/DailyQuoteDto.dart' as _i460;
import 'domain/repository/home_repository.dart' as _i405;
import 'domain/repository/local_repository.dart' as _i279;
import 'domain/repository/login_repository.dart' as _i373;
import 'domain/usecase/add_local_quote_usecase.dart' as _i359;
import 'domain/usecase/clear_all_data_usecase.dart' as _i601;
import 'domain/usecase/delete_quote_by_seq_usecase.dart' as _i457;
import 'domain/usecase/find_local_quote_by_id_usecase.dart' as _i531;
import 'domain/usecase/get_access_token_usecase.dart' as _i193;
import 'domain/usecase/get_daily_quote_non_member_usecase.dart' as _i580;
import 'domain/usecase/get_daily_quote_usecase.dart' as _i12;
import 'domain/usecase/get_image_uri_usecase.dart' as _i300;
import 'domain/usecase/get_local_quotes_paging_usecase.dart' as _i292;
import 'domain/usecase/get_local_quotes_usecase.dart' as _i1037;
import 'domain/usecase/get_login_status_usecase.dart' as _i383;
import 'domain/usecase/get_refresh_token_usecase.dart' as _i51;
import 'domain/usecase/get_token_expired_usecase.dart' as _i751;
import 'domain/usecase/is_first_open_usecase.dart' as _i133;
import 'domain/usecase/login_usecase.dart' as _i579;
import 'domain/usecase/post_like_request_usecase.dart' as _i783;
import 'domain/usecase/post_upload_image_usecase.dart' as _i426;
import 'domain/usecase/set_access_token_usecase.dart' as _i173;
import 'domain/usecase/set_first_open_usecase.dart' as _i504;
import 'domain/usecase/set_image_uri_usecase.dart' as _i1000;
import 'domain/usecase/set_refresh_token_usecase.dart' as _i904;
import 'domain/usecase/update_local_quote_like_usecase.dart' as _i177;
import 'domain/usecase/update_local_quote_memo_usecase.dart' as _i729;
import 'domain/usecase/update_quote_usecase.dart' as _i658;
import 'presentation/viewmodels/home_viewmodel.dart' as _i199;
import 'presentation/viewmodels/login_viewmodel.dart' as _i15;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final apiModule = _$ApiModule();
  gh.factory<_i17.LocalDatabase>(() => _i17.LocalDatabase());
  gh.lazySingleton<_i361.Dio>(() => apiModule.dio());
  gh.lazySingleton<_i460.SharedPreferencesAsync>(() => apiModule.providePref());
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
  gh.lazySingleton<_i279.LocalRepository>(
    () => _i239.LocalRepositoryImpl(
      prefs: gh<_i460.SharedPreferencesAsync>(),
      localQuoteInfoDao: gh<_i17.LocalDatabase>(),
    ),
  );
  gh.lazySingleton<_i383.GetLoginStatusUseCase>(
    () => _i383.GetLoginStatusUseCase(
      localRepository: gh<_i279.LocalRepository>(),
    ),
  );
  gh.factory<_i460.DailyQuoteDto>(
    () => _i460.DailyQuoteDto(
      likeYn: gh<String>(),
      imagePath: gh<String>(),
      dailyQuoteSeq: gh<int>(),
      korQuote: gh<String>(),
      engQuote: gh<String>(),
      korAuthor: gh<String>(),
      engAuthor: gh<String>(),
      authorUrl: gh<String>(),
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
  gh.lazySingleton<_i751.GetTokenExpiredUseCase>(
    () => _i751.GetTokenExpiredUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i601.ClearAllDataUseCase>(
    () => _i601.ClearAllDataUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i177.UpdateLocalQuoteLikeUseCase>(
    () => _i177.UpdateLocalQuoteLikeUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i1000.SetImageUriUseCase>(
    () => _i1000.SetImageUriUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i504.SetFirstOpenUseCase>(
    () => _i504.SetFirstOpenUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i300.GetImageUriUseCase>(
    () => _i300.GetImageUriUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i193.GetAccessTokenUseCase>(
    () => _i193.GetAccessTokenUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i51.GetRefreshTokenUseCase>(
    () => _i51.GetRefreshTokenUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i457.DeleteQuoteBySeqUseCase>(
    () => _i457.DeleteQuoteBySeqUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i658.UpdateQuoteUseCase>(
    () => _i658.UpdateQuoteUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i173.SetAccessTokenUseCase>(
    () => _i173.SetAccessTokenUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i359.AddLocalQuoteUseCase>(
    () => _i359.AddLocalQuoteUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i729.FindLocalQuoteByIdUseCase>(
    () => _i729.FindLocalQuoteByIdUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i1037.GetLocalQuotesUseCase>(
    () => _i1037.GetLocalQuotesUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i292.GetLocalQuotesPagingUseCase>(
    () => _i292.GetLocalQuotesPagingUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i133.IsFirstOpenUseCase>(
    () => _i133.IsFirstOpenUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i531.FindLocalQuoteByIdUseCase>(
    () => _i531.FindLocalQuoteByIdUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i904.SetRefreshTokenUseCase>(
    () => _i904.SetRefreshTokenUseCase(gh<_i279.LocalRepository>()),
  );
  gh.lazySingleton<_i373.LoginRepository>(
    () => _i371.LoginRepositoryImpl(api: gh<_i704.FillsaNoTokenApi>()),
  );
  gh.lazySingleton<_i579.LoginUseCase>(
    () => _i579.LoginUseCase(gh<_i373.LoginRepository>()),
  );
  gh.factory<_i15.LoginViewModel>(
    () => _i15.LoginViewModel(
      gh<_i173.SetAccessTokenUseCase>(),
      gh<_i904.SetRefreshTokenUseCase>(),
      loginUseCase: gh<_i579.LoginUseCase>(),
    ),
  );
  gh.factory<_i199.HomeViewModel>(
    () => _i199.HomeViewModel(
      gh<_i580.GetDailyNonMemberUseCase>(),
      gh<_i383.GetLoginStatusUseCase>(),
      gh<_i783.PostLikeUseCase>(),
      gh<_i531.FindLocalQuoteByIdUseCase>(),
      gh<_i177.UpdateLocalQuoteLikeUseCase>(),
      gh<_i359.AddLocalQuoteUseCase>(),
    ),
  );
  return getIt;
}

class _$ApiModule extends _i753.ApiModule {}
