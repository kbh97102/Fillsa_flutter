import 'package:fillsa_flutter/presentation/ui/typing/typing_action_bar.dart';
import 'package:fillsa_flutter/presentation/ui/typing/typing_app_bar.dart';
import 'package:fillsa_flutter/presentation/ui/typing/typing_text_display.dart';
import 'package:fillsa_flutter/presentation/util/LocaleOption.dart';
import 'package:fillsa_flutter/presentation/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class TypingScreen extends StatefulWidget {
  // TODO: 실제 데이터는 UseCase/Provider로 교체 예정
  final String? quote;

  const TypingScreen({super.key, this.quote});

  @override
  State<TypingScreen> createState() => _TypingScreenState();
}

class _TypingScreenState extends State<TypingScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  LocaleOption _locale = LocaleOption.KR;
  bool _isLiked = false;

  static const String _placeholderQuote =
      '상황을 가장 잘 활용하는 사람이 가장 좋은 상황을 맞는다.';

  String get _quote => widget.quote ?? _placeholderQuote;

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
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('복사되었습니다.')),
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
              onLocaleChange: (l) => setState(() => _locale = l),
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
              onExit: () => context.pop(),
              isLiked: _isLiked,
              onCopy: _copyText,
              onShare: () => ShareRoute().push(context),
              onLike: () => setState(() => _isLiked = !_isLiked),
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
