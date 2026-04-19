import 'package:fillsa_flutter/domain/model/response/DailyQuoteDto.dart';
import 'package:fillsa_flutter/presentation/ui/typing/typing_action_bar.dart';
import 'package:fillsa_flutter/presentation/ui/typing/typing_app_bar.dart';
import 'package:fillsa_flutter/presentation/ui/typing/typing_provider.dart';
import 'package:fillsa_flutter/presentation/ui/typing/typing_text_display.dart';
import 'package:fillsa_flutter/presentation/util/LocaleOption.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TypingScreen extends ConsumerStatefulWidget {
  final DailyQuoteDto? dailyQuoteDto;

  const TypingScreen({super.key, this.dailyQuoteDto});

  @override
  ConsumerState<TypingScreen> createState() => _TypingScreenState();
}

class _TypingScreenState extends ConsumerState<TypingScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  LocaleOption _locale = LocaleOption.KR;
  bool _isLiked = false;

  static const String _placeholderQuote =
      '상황을 가장 잘 활용하는 사람이 가장 좋은 상황을 맞는다.';

  String get _quote {
    final dto = widget.dailyQuoteDto;
    if (dto == null) return _placeholderQuote;
    return (_locale == LocaleOption.KR ? dto.korQuote : dto.engQuote) ??
        _placeholderQuote;
  }

  String get _committedText {
    final composing = _controller.value.composing;
    if (composing.isValid && !composing.isCollapsed) {
      return _controller.text.substring(0, composing.start);
    }
    return _controller.text;
  }

  String get _composingText {
    final composing = _controller.value.composing;
    if (composing.isValid && !composing.isCollapsed) {
      return _controller.text.substring(composing.start, composing.end);
    }
    return '';
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      final seq = widget.dailyQuoteDto?.dailyQuoteSeq;
      if (seq != null) {
        ref.read(typingViewModelProvider.notifier).load(seq);
      }
    });
  }

  void _onTextChanged() {
    if (_controller.text.length > _quote.length) {
      _controller.text = _controller.text.substring(0, _quote.length);
      _controller.selection = TextSelection.collapsed(offset: _quote.length);
      return;
    }
    setState(() {});
  }

  void _copyText() {
    Clipboard.setData(ClipboardData(text: _quote));
    _showToast('복사되었습니다.');
  }

  void _save() {
    final dto = widget.dailyQuoteDto;
    if (dto == null) {
      _showToast('저장되었습니다.');
      return;
    }
    try {
      ref.read(typingViewModelProvider.notifier).save(
        dailyQuote: dto,
        korTyping: _locale == LocaleOption.KR ? _committedText : '',
        engTyping: _locale == LocaleOption.EN ? _committedText : '',
        isLiked: _isLiked,
      );
    } catch (e) {
      _showToast('저장 중 오류가 발생했습니다.');
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 20),
            const SizedBox(width: 8),
            Text(message, style: const TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: const Color(0xFF212121),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        duration: const Duration(seconds: 2),
        elevation: 0,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(typingViewModelProvider, (prev, next) {
      // 최초 로드: 저장된 텍스트/좋아요 반영
      if ((prev?.isLoading ?? false) && !next.isLoading) {
        final saved = _locale == LocaleOption.KR
            ? next.savedKorTyping
            : next.savedEngTyping;
        if (saved.isNotEmpty && _controller.text.isEmpty) {
          _controller.text = saved;
          _controller.selection =
              TextSelection.collapsed(offset: saved.length);
        }
        if (!_isLiked && next.isLiked) {
          setState(() => _isLiked = next.isLiked);
        }
      }
      if ((prev?.saveCount ?? 0) != next.saveCount) {
        _showToast('저장되었습니다.');
      } else if (next.errorMessage != null &&
          prev?.errorMessage != next.errorMessage) {
        _showToast('저장 중 오류가 발생했습니다.');
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TypingAppBar(
              onBack: () => context.pop(),
              locale: _locale,
              onLocaleChange: (l) => setState(() {
                _locale = l;
                _controller.clear();
              }),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _focusNode.requestFocus(),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: TypingTextDisplay(
                    quote: _quote,
                    typedText: _committedText,
                    composingText: _composingText,
                  ),
                ),
              ),
            ),
            TypingActionBar(
              isLiked: _isLiked,
              onCopy: _copyText,
              onShare: () => ShareRoute().push(context),
              onLike: () => setState(() => _isLiked = !_isLiked),
              onSave: _save,
            ),
            // 키보드 입력 캡처용 숨김 TextField
            Offstage(
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
