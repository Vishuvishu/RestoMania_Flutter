import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

//============================================================
// **  Scaffold **
//============================================================

Widget appScaffold({
  Key? key,
  PreferredSizeWidget? appBar,
  Widget? drawer,
  Widget? body,
  Widget? floatingActionButton,
  FloatingActionButtonLocation? floatingActionButtonLocation,
  FloatingActionButtonAnimator? floatingActionButtonAnimator,
  List<Widget>? persistentFooterButtons,
  AlignmentDirectional persistentFooterAlignment = AlignmentDirectional.centerEnd,
  void Function(bool)? onDrawerChanged,
  Widget? endDrawer,
  void Function(bool)? onEndDrawerChanged,
  Widget? bottomNavigationBar,
  Widget? bottomSheet,
  Color? backgroundColor,
  bool? resizeToAvoidBottomInset,
  bool primary = true,
  DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start,
  bool extendBody = false,
  bool extendBodyBehindAppBar = false,
  Color? drawerScrimColor,
  double? drawerEdgeDragWidth,
  bool drawerEnableOpenDragGesture = false,
  bool endDrawerEnableOpenDragGesture = false,
  String? restorationId,
}) {
  return GestureDetector(
    onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();
    },
    child: SafeArea(
      top: true,
      child: Scaffold(
        drawer: drawer ,
        key: key,
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        floatingActionButtonAnimator: floatingActionButtonAnimator,
        persistentFooterButtons: persistentFooterButtons,
        persistentFooterAlignment: persistentFooterAlignment,
        onDrawerChanged: onDrawerChanged,
        endDrawer: endDrawer,
        onEndDrawerChanged: onEndDrawerChanged,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        backgroundColor: AppColors.xffFBF3E8,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        primary: primary,
        drawerDragStartBehavior: drawerDragStartBehavior,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        drawerScrimColor: drawerScrimColor,
        drawerEdgeDragWidth: drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
        restorationId: restorationId,
      ),
    ),
  );
}
