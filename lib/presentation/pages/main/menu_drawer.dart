import 'package:flutter/material.dart';
import 'package:flutter_auth/core/core.dart';
import 'package:flutter_auth/data/data.dart';
import 'package:flutter_auth/presentation/pages/main/cubit/nav_drawer_cubit.dart';
import 'package:flutter_auth/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../resources/resources.dart';
import '../../widgets/widgets.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    Key? key,
    required this.dataMenu,
    required this.currentIndex,
    this.onLogoutPressed,
  }) : super(key: key);
  final List<DataHelper> dataMenu;
  final Function(int) currentIndex;
  final VoidCallback? onLogoutPressed;

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: context.widthInPercent(100),
            height: Dimens.header,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Row(
                children: [
                  CircleImage(
                    size: Dimens.profilePicture,
                    url: Constants.get.imagePlaceHolder,
                  ),
                  const SpacerHorizontal(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Abdul Karim",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Palette.white),
                        ),
                        Text(
                          "ak339444@gmail.com",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpacerVertical(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.dataMenu
                .map<Widget>(
                  (value) => SizedBox(
                width: double.maxFinite,
                child: InkWell(
                  onTap: () {
                    for (final menu in widget.dataMenu) {
                      menu.isSelected = menu.title == value.title;

                      if (value.title != null) {
                        widget.currentIndex(
                          widget.dataMenu.indexOf(value),
                        );
                      }
                    }

                    _selectedPage(value.title!);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.space12,
                      horizontal: Dimens.space24,
                    ),
                    child: Text(
                      value.title!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            )
                .toList(),
          ), //
          const SpacerHorizontal(),
        ],
      ),
    );
  }

  //TODO : Update page from selected Page
  void _selectedPage(String title) {
    //TODO : Update page from selected Page
    if (title == Strings.of(context)!.settings) {
      context.read<NavDrawerCubit>().openDrawer(Navigation.settingsPage);
    } else if (title == Strings.of(context)!.dashboard) {
      context.read<NavDrawerCubit>().openDrawer(Navigation.dashboardPage);
    } else if (title == Strings.of(context)!.logout) {
      widget.onLogoutPressed?.call();
    }
  }
}
