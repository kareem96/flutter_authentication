import 'package:flutter/material.dart';
import 'package:flutter_auth/presentation/pages/main/create/cubit/create_cubit.dart';
import 'package:flutter_auth/presentation/presentation.dart';
import 'package:flutter_auth/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecase/auth/post_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _nameController = TextEditingController();
  final _jobController = TextEditingController();

  final _fnName = FocusNode();
  final _fnJob = FocusNode();

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: MyAppBar().call(),
      child: BlocListener<CreateCubit, CreateState>(
        listener: (_, state) {
          switch (state.status) {
            case CreateStatus.loading:
              context.show();
              break;
            case CreateStatus.success:
              context.dismiss();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Created Successfully!")));
              context.back();
              break;
            case CreateStatus.failure:
              context.dismiss();
              state.message.toString().toToastError();
              break;
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: AutofillGroup(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextForm(
                        autofillHints: const [AutofillHints.name],
                        key: const Key("Name"),
                        curFocusNode: _fnName,
                        nextFocusNode: _fnJob,
                        textInputAction: TextInputAction.next,
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                        hintText: 'Your Name',
                        // hint: Strings.of(context)!.email,
                        // validator: (String? value) => value != null ? (!value.isValidEmail() ? Strings.of(context)?.errorInvalidEmail : null): null
                      ),
                      TextForm(
                        autofillHints: const [AutofillHints.jobTitle],
                        key: const Key("Job"),
                        curFocusNode: _fnJob,
                        textInputAction: TextInputAction.next,
                        controller: _jobController,
                        keyboardType: TextInputType.text,
                        prefixIcon: Icon(
                          Icons.work,
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                        hintText: 'Your Job',
                        // hint: Strings.of(context)!.email,
                        // validator: (String? value) => value != null ? (!value.isValidEmail() ? Strings.of(context)?.errorInvalidEmail : null): null
                      ),
                      Button(
                        // title: Strings.of(context)!.login,
                        title: "Create",
                        onPressed: () {
                          if (_keyForm.currentState?.validate() ?? false) {
                            context.read<CreateCubit>().create(
                                  CreateParams(
                                    name: _nameController.text,
                                    job: _jobController.text,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
