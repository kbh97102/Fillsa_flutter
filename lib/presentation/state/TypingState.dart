enum StreakPopupType { none, completed, consecutive }

class TypingState {
  final bool isSaving;
  final bool isLoading;
  final int saveCount;
  final String? errorMessage;
  final String savedKorTyping;
  final String savedEngTyping;
  final bool isLiked;
  final StreakPopupType streakPopupType;

  const TypingState({
    this.isSaving = false,
    this.isLoading = false,
    this.saveCount = 0,
    this.errorMessage,
    this.savedKorTyping = '',
    this.savedEngTyping = '',
    this.isLiked = false,
    this.streakPopupType = StreakPopupType.none,
  });

  TypingState copyWith({
    bool? isSaving,
    bool? isLoading,
    int? saveCount,
    String? errorMessage,
    bool clearError = false,
    String? savedKorTyping,
    String? savedEngTyping,
    bool? isLiked,
    StreakPopupType? streakPopupType,
  }) {
    return TypingState(
      isSaving: isSaving ?? this.isSaving,
      isLoading: isLoading ?? this.isLoading,
      saveCount: saveCount ?? this.saveCount,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      savedKorTyping: savedKorTyping ?? this.savedKorTyping,
      savedEngTyping: savedEngTyping ?? this.savedEngTyping,
      isLiked: isLiked ?? this.isLiked,
      streakPopupType: streakPopupType ?? this.streakPopupType,
    );
  }
}
