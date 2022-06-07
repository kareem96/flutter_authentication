import 'package:flutter/material.dart';
import 'package:flutter_auth/presentation/resources/dimens.dart';

import '../resources/resources.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const ButtonText({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          primary: Palette.primaryLight,
        ),
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.button,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

