import 'package:flutter/material.dart';
import 'package:flutter_auth/presentation/resources/dimens.dart';

class SpacerVertical extends StatelessWidget {
  final double? value;
  const SpacerVertical({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: value ?? Dimens.space8,
    );
  }
}
