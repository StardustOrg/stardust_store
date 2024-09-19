import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_store/utils/constants/image_string.dart';
import 'package:stardust_store/utils/constants/sizes.dart';

class StarLogo extends StatelessWidget {
  const StarLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            StarImages.logo,
            semanticsLabel: 'brand logo',
            width: StarSizes.logoXXl,
          ),
        ],
      ),
    );
  }
}
