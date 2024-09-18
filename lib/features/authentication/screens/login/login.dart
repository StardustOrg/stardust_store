import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/app_logo.dart';
import 'package:stardust_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:stardust_store/features/authentication/screens/login/widgets/social_login.dart';
import 'package:stardust_store/utils/constants/sizes.dart';
import 'package:stardust_store/utils/device/device_utility.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // Centraliza o conteúdo na tela
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 400, // Altura mínima
                maxHeight: StarDeviceUtils.getScreenHeight(context) *
                    0.9, // Altura máxima (90% da tela)
                minWidth: 400, // Largura mínima
                maxWidth: 400, // Largura máxima
              ),
              child: Container(
                padding: const EdgeInsets.all(20), // Espaçamento interno
                child: const Column(
                  mainAxisSize:
                      MainAxisSize.min, // Restringir o tamanho do Column
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
      ),
    );
  }
}
