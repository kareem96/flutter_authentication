import 'package:flutter/material.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/utils/utils.dart';

import '../resources/resources.dart';

class Empty extends StatelessWidget {
  final String? errorMessage;
  const Empty({Key? key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.icLauncher, width: context.widthInPercent(45),),
        Text(errorMessage ?? Strings.of(context)!.errorNoData)
      ],
    );
  }
}
