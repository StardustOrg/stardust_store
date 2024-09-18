import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stardust_store/utils/constants/sizes.dart';
import 'package:stardust_store/utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StarTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),

          // Email Field
          TextFormField(
            decoration: const InputDecoration(
              labelText: StarTexts.email,
              hintText: StarTexts.emailLabel,
            ),
          ),
          const SizedBox(height: StarSizes.spaceBtwItems),

          // Password Field
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: StarTexts.password,
              hintText: StarTexts.passwordLabel,
            ),
          ),
          const SizedBox(height: 15),

          // Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(StarTexts.forgotPassword),
            ),
          ),
          const SizedBox(height: 10),
          // Login Button with Obx (Reactive State Management)
          Center(
            child: ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromWidth(500),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(StarTexts.login),
            ),
          ),

          const SizedBox(height: 10), // Add space between elements

          // Signup Option (Optional)
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () => {}, // Navigate to sign up
              child: const Text(StarTexts.signUp),
            ),
          ),
        ],
      ),
    );
  }
}
