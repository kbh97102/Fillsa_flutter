// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fillsa_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter

class _FillsaApi implements FillsaApi {
  _FillsaApi(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<HttpResponse<DailyQuotaNoToken>> getDailyQuoteNonMember() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<HttpResponse<DailyQuotaNoToken>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/api/v1/quotes/daily',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DailyQuotaNoToken _value;
    try {
      _value = DailyQuotaNoToken.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    final httpResponse = HttpResponse(_value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(fillsaApi)
const fillsaApiProvider = FillsaApiProvider._();

final class FillsaApiProvider
    extends $FunctionalProvider<FillsaApi, FillsaApi, FillsaApi>
    with $Provider<FillsaApi> {
  const FillsaApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fillsaApiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fillsaApiHash();

  @$internal
  @override
  $ProviderElement<FillsaApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FillsaApi create(Ref ref) {
    return fillsaApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FillsaApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FillsaApi>(value),
    );
  }
}

String _$fillsaApiHash() => r'c76861315479ed83ccebdae4085a0adeabc78411';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
