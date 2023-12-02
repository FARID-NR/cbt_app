import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String iconUrl;
  final double? height;
  final double? width;
  final Color? color;
  const SvgIcon({
    Key? key,
    required this.iconUrl,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconUrl,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(
        color ?? Colors.black,
        BlendMode.srcIn,
      ),
    );
  }
}