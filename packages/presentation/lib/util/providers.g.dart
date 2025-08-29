// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

@ProviderFor(getDailyNonMemberUseCase)
const getDailyNonMemberUseCaseProvider = GetDailyNonMemberUseCaseProvider._();

final class GetDailyNonMemberUseCaseProvider
    extends
        $FunctionalProvider<
          GetDailyNonMemberUseCase,
          GetDailyNonMemberUseCase,
          GetDailyNonMemberUseCase
        >
    with $Provider<GetDailyNonMemberUseCase> {
  const GetDailyNonMemberUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDailyNonMemberUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDailyNonMemberUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetDailyNonMemberUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetDailyNonMemberUseCase create(Ref ref) {
    return getDailyNonMemberUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetDailyNonMemberUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetDailyNonMemberUseCase>(value),
    );
  }
}

String _$getDailyNonMemberUseCaseHash() =>
    r'97e43fc02ffa0b9dde01bbc25c317dd3984db3b0';

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
