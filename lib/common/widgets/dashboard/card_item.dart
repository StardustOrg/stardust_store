import 'package:flutter/material.dart';
import 'package:stardust_store/utils/constants/colors.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String value;
  final bool isLast;

  const CardItem({
    super.key,
    required this.title,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   border: isLast
      //       ? null
      //       : const Border(
      //           right: BorderSide(
      //             color: Colors.grey, // You can change the color as needed
      //             width: 2.0, // You can change the width as needed
      //           ),
      //         ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
