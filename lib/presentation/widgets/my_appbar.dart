import 'package:flutter/material.dart';

class MyAppBar {
  const MyAppBar();

  PreferredSize call() => PreferredSize(
      child: AppBar(),
      preferredSize: const Size.fromHeight(kToolbarHeight));
}
