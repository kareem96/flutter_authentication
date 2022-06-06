

import 'package:flutter/material.dart';

import 'package:flutter_auth/presentation/widgets/color_loaders.dart';

import '../../core/core.dart';

class Loading extends StatelessWidget {
  final bool showMessage;
  const Loading({Key? key, this.showMessage = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ColorLoader(),
          Visibility(
            visible: showMessage,
            child: Text(
              Strings.of(context)!.pleaseWait,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
