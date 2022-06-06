import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  final Widget? child;
  final PreferredSize? appBar;
  final bool? avoidBottomInset;
  final Widget? floatingButton;
  final Widget? bottomNavigation;

  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final Key? scaffoldKey;
  final bool extendedBodyBehindAppBar;
  const Parent({
    Key? key,
    this.child,
    this.appBar,
    this.avoidBottomInset,
    this.floatingButton,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.scaffoldKey,
    this.extendedBodyBehindAppBar = false,
    this.bottomNavigation
  }) : super(key: key);

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        key: widget.scaffoldKey,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: widget.avoidBottomInset,
        extendBodyBehindAppBar: widget.extendedBodyBehindAppBar,
        appBar: widget.appBar,
        body: widget.child,
        drawer: widget.drawer,
        endDrawer: widget.endDrawer,
        floatingActionButton: widget.floatingButton,
        bottomNavigationBar: widget.bottomNavigation
      ),
    );
  }
}
