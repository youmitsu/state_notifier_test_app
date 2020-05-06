import 'package:flutter/material.dart';

import 'fade_page_route.dart';
import 'side_slide_page_route.dart';

enum NavType {
  slide,
  fade,
  unknown,
}

class CustomPageRouteBuilder {
  static PageRoute buildPageRoute(NavType navType, Widget page) {
    switch (navType) {
      case NavType.slide:
        return SideSlidePageRoute(builder: (_) => page);
        break;
      case NavType.fade:
        return FadePageRoute(builder: (_) => page);
        break;
      default:
        return MaterialPageRoute(builder: (_) => page);
    }
  }
}
