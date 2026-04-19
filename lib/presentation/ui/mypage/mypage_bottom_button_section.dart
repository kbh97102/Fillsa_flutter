import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyPageBottomButtonSection extends StatefulWidget {
  final bool isLogged;
  final VoidCallback onLogout;

  const MyPageBottomButtonSection({
    super.key,
    required this.isLogged,
    required this.onLogout,
  });

  @override
  State<MyPageBottomButtonSection> createState() =>
      _MyPageBottomButtonSectionState();
}

class _MyPageBottomButtonSectionState extends State<MyPageBottomButtonSection> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final info = await PackageInfo.fromPlatform();
    if (mounted) setState(() => _version = info.version);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('버전', style: context.fillsaTypo.subtitle1),
              Text(_version, style: context.fillsaTypo.body2),
            ],
          ),
          if (widget.isLogged)
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: widget.onLogout,
                  child: Text('로그아웃', style: context.fillsaTypo.subtitle1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
