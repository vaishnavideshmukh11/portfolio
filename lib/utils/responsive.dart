import 'package:flutter/material.dart';

enum DisplayType {
  mobile,
  tablet,
  desktop,
}

const num _mobileMaxBreakPoint = 700, _tabletMaxBreakPoint = 1440;

DisplayType displayTypeOf(BuildContext context) =>
    MediaQuery.of(context).size.width > _tabletMaxBreakPoint
        ? DisplayType.desktop
        : MediaQuery.of(context).size.width < _tabletMaxBreakPoint &&
                MediaQuery.of(context).size.width > _mobileMaxBreakPoint
            ? DisplayType.tablet
            : DisplayType.mobile;

bool isMobile(BuildContext context) =>
    displayTypeOf(context) == DisplayType.mobile;

bool isTablet(BuildContext context) =>
    displayTypeOf(context) == DisplayType.tablet;

bool isDesktop(BuildContext context) =>
    displayTypeOf(context) == DisplayType.desktop;
