import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/app_logo.dart';
import 'package:stardust_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:stardust_store/features/authentication/screens/login/widgets/social_login.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/image_string.dart';
import 'package:stardust_store/utils/constants/sizes.dart';
import 'package:stardust_store/utils/device/device_utility.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            // Imagem à esquerda ocupando metade da largura e toda a altura
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(color: StarColors.starPink),
              ),
            ),
            // Formulário de login à direita ocupando metade da largura
            Expanded(
              flex: 1,
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: StarSizes.spaceBtwSections,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: StarDeviceUtils.getScreenHeight(context) * 0.9,
                      maxWidth: StarSizes.inputFormWidth,
                    ),
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StarLogo(),
                        SizedBox(height: StarSizes.spaceBtwSections),
                        LoginForm(),
                        SizedBox(height: StarSizes.spaceBtwSections),
                        DifferentWaysToLogin(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
