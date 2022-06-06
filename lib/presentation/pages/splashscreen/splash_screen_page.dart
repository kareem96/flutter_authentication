import 'package:flutter/material.dart';
import 'package:flutter_auth/di/di.dart';
import 'package:flutter_auth/presentation/resources/resources.dart';
import 'package:flutter_auth/presentation/widgets/parent.dart';
import 'package:flutter_auth/utils/ext/context.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/data.dart';
import '../app_route.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      _initData();
    });
  }
  void _initData() {
    if(sl<PrefManager>().isLogin){
      context.goToReplace(AppRoute.mainScreen);
    }else{
      context.goToReplace(AppRoute.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Container(
        color: Palette.white,
        child: Center(
          child: SvgPicture.asset(
            Images.icLogo,
            width: context.widthInPercent(60),
          ),
        ),
      ),
    );
  }
}
