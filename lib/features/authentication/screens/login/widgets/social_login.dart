import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/image_string.dart';
import 'package:stardust_store/utils/constants/sizes.dart';
import 'package:stardust_store/utils/constants/text_strings.dart';
import 'package:stardust_store/utils/device/device_utility.dart';

class DifferentWaysToLogin extends StatelessWidget {
  const DifferentWaysToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(
              StarSizes.loginButtonWidth,
              StarSizes.buttonHeight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                StarImages.googleSvg,
                height: StarSizes.iconMd,
                colorFilter:
                    const ColorFilter.mode(StarColors.grey, BlendMode.srcIn),
              ),
              const SizedBox(width: StarSizes.defaultSpace),
              const Text(StarTexts.loginWithGoogle),
            ],
          ),
        ),
        const SizedBox(height: StarSizes.spaceBtwItems),
        OutlinedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(
              StarSizes.loginButtonWidth,
              StarSizes.buttonHeight,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                StarImages.facebookSvg,
                height: StarSizes.iconMd,
                colorFilter:
                    const ColorFilter.mode(StarColors.grey, BlendMode.srcIn),
              ),
              const SizedBox(width: StarSizes.defaultSpace),
              const Text(StarTexts.loginWithFacebook),
            ],
          ),
        ),
      ],
    );
  }
}
