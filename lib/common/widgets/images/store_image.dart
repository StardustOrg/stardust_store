import 'package:flutter/material.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/sizes.dart';

class StarStoreImage extends StatelessWidget {
  const StarStoreImage({
    super.key,
    this.size = StarSizes.storeSm,
    this.imageUrl,
    this.borderColor = StarColors.starPink,
  });

  final double size;
  final String? imageUrl;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: StarColors.placeholder,
        image: imageUrl != null
            ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
            : null,
        border: Border(
          bottom: BorderSide(width: 3, color: borderColor),
          right: BorderSide(width: 3, color: borderColor),
        ),
      ),
      // TODO: Add image
    );
  }
}
