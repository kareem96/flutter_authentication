import 'package:flutter/material.dart';
import 'package:flutter_auth/presentation/resources/resources.dart';
import 'package:flutter_auth/utils/ext/context.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;

  const Button(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.width,
      this.color,
      this.titleColor,
      this.fontSize,
      this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minWidth: width ?? context.widthInPercent(100)),
      margin: EdgeInsets.symmetric(vertical: Dimens.space8),
      height: Dimens.buttonH,
      decoration:
          BoxDecorations.button.copyWith(color: color ?? Palette.primary),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: color ?? Palette.primary,
            primary: Palette.hint,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space24),
            shape: const BeveledRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(Dimens.cornerRadius)))),
        child: Text(
          title.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(color: Palette.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
