import 'package:flutter/material.dart';

class SideSlidePageRoute<T> extends MaterialPageRoute<T> {
  SideSlidePageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SideSlideTransition(
      routeAnimation: animation,
      child: child,
    );
  }
}

class SideSlideTransition extends StatelessWidget {
  SideSlideTransition({
    Key key,
    @required Animation<double> routeAnimation,
    @required this.child,
  })  : _slideAnimation = routeAnimation.drive(_slideTween),
        super(key: key);

  static final Animatable<Offset> _slideTween =
      Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
          .chain(CurveTween(curve: Curves.fastOutSlowIn));

  final Animation<Offset> _slideAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: child,
    );
  }
}
