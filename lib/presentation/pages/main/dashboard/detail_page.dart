import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/presentation/presentation.dart';

import '../../../../domain/domain.dart';

class DetailPage extends StatefulWidget {
  final User users;

  const DetailPage({Key? key, required this.users}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
        appBar: const MyAppBar().call(),
        child: Parent(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: AutofillGroup(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                          tag: widget.users.avatar ?? "",
                          child: CachedNetworkImage(
                            imageUrl: widget.users.avatar ?? "",
                            width: 500,
                            height: 200,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                      Text(widget.users.name ?? ""),
                      const SizedBox(height: 20,),
                      Text(widget.users.email ?? ""),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
