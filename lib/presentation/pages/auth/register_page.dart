import 'package:flutter/material.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/presentation/pages/auth/cubit/cubit.dart';
import 'package:flutter_auth/presentation/resources/resources.dart';
import 'package:flutter_auth/utils/ext/ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../domain/domain.dart';
import '../../widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordConfirmation = FocusNode();

  bool _isPasswordHide = true;
  bool _isPasswordConfirmationHide = true;
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: const MyAppBar().call(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (_, state) {
          switch (state.status) {
            case RegisterStatus.loading:
              context.show();
              break;
            case RegisterStatus.success:
              context.dismiss();
              context.back();
              break;
            case RegisterStatus.failure:
              context.dismiss();
              state.message.toString().toToastError();
              break;
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.icLogo,
                      width: context.widthInPercent(50),
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                    const SpacerVertical(),
                    TextForm(
                      key: const Key("email"),
                      curFocusNode: _fnEmail,
                      nextFocusNode: _fnPassword,
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      hintText: "sample@gmail.com",
                      hint: Strings.of(context)!.email,
                      validator: (String? value) => value != null
                          ? (!value.isValidEmail()
                              ? Strings.of(context)?.errorInvalidEmail
                              : null)
                          : null,
                    ),
                    TextForm(
                      key: const Key("password"),
                      curFocusNode: _fnPassword,
                      nextFocusNode: _fnPasswordConfirmation,
                      textInputAction: TextInputAction.next,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      hintText: "••••••••••••",
                      hint: Strings.of(context)!.password,
                      maxLine: 1,
                      obscureText: _isPasswordHide,
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          setState(() {
                            _isPasswordHide = !_isPasswordHide;
                          });
                        },
                        icon: Icon(
                          _isPasswordHide
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (String? value) => value != null
                          ? (value.length < 3
                              ? Strings.of(context)?.errorEmptyField
                              : null)
                          : null,
                    ),
                    TextForm(
                        key: const Key("password_confirmation"),
                        curFocusNode: _fnPasswordConfirmation,
                        textInputAction: TextInputAction.done,
                        controller: _passwordConfirmationController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                        hintText: "••••••••••••",
                        obscureText: _isPasswordConfirmationHide,
                        hint: Strings.of(context)!.password,
                        maxLine: 1,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            setState(() {
                              _isPasswordConfirmationHide =
                                  !_isPasswordConfirmationHide;
                            });
                          },
                          icon: Icon(
                            _isPasswordConfirmationHide
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        validator: (String? value) => value != null
                            ? (value != _passwordController.text
                                ? Strings.of(context)?.errorPasswordNotMatch
                                : null)
                            : null),
                    SpacerVertical(
                      value: Dimens.space24,
                    ),
                    Button(
                        title: Strings.of(context)!.register,
                        onPressed: () {
                          if (_keyForm.currentState?.validate() ?? false) {
                            context
                                .read<RegisterCubit>()
                                .register(RegisterParams(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ));
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
