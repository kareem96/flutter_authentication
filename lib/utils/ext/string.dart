import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_auth/presentation/resources/palette.dart';
import 'package:flutter_auth/presentation/widgets/toast.dart';
import 'package:flutter_auth/utils/utils.dart';
import 'package:oktoast/oktoast.dart';

extension StringExtension on String{
  bool isValidEmail(){
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  void toToastError(){
    try{
      final message = isEmpty ? "error" : this;
      dismissAllToast(showAnim: true);
      showToastWidget(
        Toast(
          bgColor: Palette.red,
          icon: Icons.error,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    }catch(e){
      log.e("error $e");
    }
  }

  void toToastSuccess(){
    try{
      final message = isEmpty ? "success" : this;
      dismissAllToast(showAnim: true);
      showToastWidget(
        Toast(
          bgColor: Palette.green,
          icon: Icons.check_circle,
          message: message,
          textColor: Colors.white,
        ),
        dismissOtherToast: true,
        position: ToastPosition.top,
        duration: const Duration(seconds: 3),
      );
    }catch(e){
      log.e("$e");
    }
  }
}