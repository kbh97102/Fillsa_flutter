import 'package:fillsa_flutter/presentation/util/colors.dart';
import 'package:fillsa_flutter/presentation/util/extensions.dart';
import 'package:flutter/material.dart';

import '../guide/custom_svg.dart';

class MyPageLoginSection extends StatelessWidget {
  final bool isLogged;
  final String userName;
  final String? imageUri;
  final VoidCallback onLoginTap;

  const MyPageLoginSection({
    super.key,
    required this.isLogged,
    required this.userName,
    required this.imageUri,
    required this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isLogged) {
      return _LoggedInSection(userName: userName, imageUri: imageUri);
    }
    return _LoggedOutSection(onLoginTap: onLoginTap);
  }
}

class _LoggedInSection extends StatelessWidget {
  final String userName;
  final String? imageUri;

  const _LoggedInSection({required this.userName, required this.imageUri});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: purple02),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFCBCBCB).withValues(alpha: 0.7),
            blurRadius: 16,
            spreadRadius: -3,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: grey100,
            child: CustomSvg(svgName: 'icn_non_member', width: 40, height: 40),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              userName,
              style: context.fillsaTypo.subtitle1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoggedOutSection extends StatelessWidget {
  final VoidCallback onLoginTap;

  const _LoggedOutSection({required this.onLoginTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLoginTap,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvg(svgName: 'icn_non_member', width: 24, height: 24),
                const SizedBox(width: 10),
                Text('로그인 후 사용 가능', style: context.fillsaTypo.subtitle1),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: purple01,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              '로그인',
              style: context.fillsaTypo.buttonMediumBold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
