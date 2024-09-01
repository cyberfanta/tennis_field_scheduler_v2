import 'package:flutter/material.dart';
import 'package:tennis_field_scheduler_v2/utils/stacks.dart';
import 'package:tennis_field_scheduler_v2/utils/stamp.dart';

import '../presentation/views/initial_view/landing_view.dart';
import '../presentation/views/inner_view/begin_view.dart';
import '../presentation/views/inner_view/favorites_view.dart';
import '../presentation/views/inner_view/reservations_view.dart';
import '../presentation/views/login_view/login_view.dart';
import '../presentation/views/login_view/signup_view.dart';

class ViewManager {
  final String _tag = "ViewManager";
  final Stacks<String> _viewStack = Stacks<String>();
  bool _isInitialized = false;
  String _controlPoint = "";

  final String _viewManagerRoot = LandingView.routeName;

  ViewManager() {
    init();
  }

  void init() {
    if (!_isInitialized) {
      stamp(_tag, "View Manager Initialized");
      _viewStack.push(_viewManagerRoot);
      stamp(_tag, "Now: $_viewStack", extraLine: true);
      _isInitialized = true;
    }
  }

  void reset(BuildContext context) {
    clearAndPush(context, _viewManagerRoot);
  }

  void push(BuildContext context, String value) {
    pushAndStay(context, value);
    _executeNavigation(context, value);
  }

  void pushAndStay(BuildContext context, String value) {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.push(value);
    stamp(_tag, "Push View: ${value.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
  }

  void pop(BuildContext context) {
    if (_viewStack.length == 1) {
      stamp(_tag, "Can pop anymore\n");
      return;
    }

    popAndStay(context);
    _executeNavigation(context, _viewStack.last!, true);
  }

  void popAndStay(BuildContext context) {
    if (_viewStack.length == 1) {
      stamp(_tag, "Can pop anymore\n");
      return;
    }

    stamp(_tag, "Before: $_viewStack");
    String? value = _viewStack.pop();
    stamp(_tag, "Pop View: ${value?.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
  }

  void clear() {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.clear();
    stamp(_tag, "Clear Views");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
  }

  void clearAndPush(BuildContext context, String value) {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.clear();
    _viewStack.push(value);
    stamp(_tag, "PushAndClear View: ${value.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
    _executeNavigation(context, value);
  }

  void resetAndPush(BuildContext context, String value) {
    stamp(_tag, "Before: $_viewStack");
    _viewStack.clear();
    _viewStack.push(_viewManagerRoot);
    _viewStack.push(value);
    stamp(_tag, "ResetAndClear View: ${value.substring(1)}");
    stamp(_tag, "Now: $_viewStack", extraLine: true);
    _executeNavigation(context, value);
  }

  void setControlPoint(String value) {
    _controlPoint = value;
    stamp(_tag, "Control Point - Set: $_controlPoint");
  }

  void goToControlPoint(BuildContext context) {
    goToControlPointAndStay(context);

    String value = _controlPoint;
    _executeNavigation(context, value);
  }

  void goToControlPointAndStay(BuildContext context) {
    stamp(_tag, "Control Point - Processing: $_controlPoint");

    while (getCurrent() != _controlPoint) {
      popAndStay(context);
    }

    stamp(_tag, "Control Point- Finishing: $_controlPoint", extraLine: true);
  }

  String getCurrent() {
    return _viewStack.last.toString();
  }

  String getParentOfCurrent() {
    if ((_viewStack.length - 2) < 0) {
      return _viewManagerRoot;
    }

    return _viewStack.elementAt(_viewStack.length - 2);
  }

  String getElementAt(int value) {
    if (value > (_viewStack.length - 1)) {
      return "";
    }

    if (value < 0) {
      return "";
    }

    return _viewStack.elementAt(value);
  }

  int getSize() {
    return _viewStack.length;
  }

  void _executeNavigation(BuildContext context, String value,
      [bool isRetuning = false]) {
    animationOpen(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      var begin = const Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    }

    animationClose(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    }

    SlideTransition Function(
            BuildContext, Animation<double>, Animation<double>, Widget)
        slideTransitionFunction = isRetuning ? animationClose : animationOpen;

    PageRouteBuilder pageRouteBuilder;

    switch (value) {
      case LandingView.routeName:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LandingView(),
          transitionsBuilder: slideTransitionFunction,
        );
      case BeginView.routeName:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const BeginView(),
          transitionsBuilder: slideTransitionFunction,
        );
      case LoginView.routeName:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginView(),
          transitionsBuilder: slideTransitionFunction,
        );
      case SignUpView.routeName:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SignUpView(),
          transitionsBuilder: slideTransitionFunction,
        );
      case ReservationsView.routeName:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ReservationsView(),
          transitionsBuilder: slideTransitionFunction,
        );
      case FavoritesView.routeName:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const FavoritesView(),
          transitionsBuilder: slideTransitionFunction,
        );
      default:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LandingView(),
          transitionsBuilder: slideTransitionFunction,
        );
    }

    Navigator.of(context).pushAndRemoveUntil(pageRouteBuilder, (r) => false);
  }
}
