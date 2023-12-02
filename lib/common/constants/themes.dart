import 'package:cbt_app/common/constants/colors.dart';
import 'package:flutter/material.dart';

const kDesktopChangePoint = 1100.0;
const kTabletChangePoint = 500.0; //768.0;
const kMobileChangePoint = 420.0;
const kSmallMobileChangePoint = 250.0;
const kMobileScreenPadding = 25.0;
const kButtonCornerRadius = 10.0;
const kCardBorderrRadius = 10.0;

const Color kPrimayLightColorLT = ColorName.white;
const Color kPrimayColorLT = ColorName.primary;

const Color kPrimayColorDT = Color.fromARGB(255, 70, 14, 160);
const Color kPrimayLightColorDT = Color.fromARGB(255, 92, 15, 210);

const kOnSurfaceTextColor = Colors.white;
const kCorrectAnswerColor = Color.fromARGB(255, 0, 188, 100);
const kWrongAnswerColor = Color.fromARGB(255, 230, 24, 24);
const kNotAnswerColor = Color.fromARGB(255, 120, 50, 80);

// main gradient pattern for light theme
const mainGradientLT = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      kPrimayLightColorLT,
      kPrimayColorLT,
    ]);

// main gradient pattern for Dark theme
const mainGradientDT = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      kPrimayLightColorDT,
      kPrimayColorDT,
    ]);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDT : mainGradientLT;


// ignore: avoid_classes_with_only_static_members
class UIParameters {

  static BorderRadius  get cardBorderRadius => BorderRadius.circular(kCardBorderrRadius);
  static EdgeInsets  get screenPadding => const EdgeInsets.all(kMobileScreenPadding);

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isDesktop(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return (kDesktopChangePoint <= _screenWidth);
  }

  static bool isMobile(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return (kTabletChangePoint > _screenWidth);
    //return (kMobileChangePoint <= _screenWidth);
  }

  static bool isTablet(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return (kTabletChangePoint <= _screenWidth);
  }

  // static List<BoxShadow> getShadow(
  //         {Color? shadowColor,
  //         double spreadRadius = 3,
  //         double blurRadius = 12}) =>
  //     [
  //       BoxShadow(
  //         color: shadowColor ?? Get.theme.shadowColor,
  //         spreadRadius: spreadRadius,
  //         blurRadius: blurRadius,
  //         offset: const Offset(0, 3),
  //       ),
  //     ];

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static double getResponsizeCardWidth(BuildContext context, int count) {
    final screenPadding = MediaQuery.of(context).viewPadding;
    final screenWidth = MediaQuery.of(context).size.width;
    return (screenWidth -
            (count * 20) -
            (screenPadding.left + screenPadding.right)) /
        count;
  }
}

class RD {
  // Responsive double
  final double d;
  final double t;
  final double m;

  const RD({required this.d, required this.t, required this.m});

  // return double value for each defined screen sizes
  double get(context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    if (kDesktopChangePoint <= _screenWidth) {
      return d;
    } else if (kTabletChangePoint <= _screenWidth) {
      return t;
    } else {
      return m;
    }
  }
}

class RWP {
  // Responsive Width Potion
  final double d;
  final double t;
  final double m;

  const RWP({required this.d, required this.t, required this.m});

  // return screen width value for each defined screen sizes
  double get(context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    if (kDesktopChangePoint <= _screenWidth) {
      return d * _screenWidth;
    } else if (kTabletChangePoint <= _screenWidth) {
      return t * _screenWidth;
    } else {
      return m * _screenWidth;
    }
  }
}
