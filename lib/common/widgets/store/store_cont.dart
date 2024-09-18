import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/images/store_image.dart';
import 'package:stardust_store/models/store.dart';
import 'package:stardust_store/utils/constants/sizes.dart';

class StoreContainer extends StatelessWidget {
  const StoreContainer({super.key, required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StarStoreImage(imageUrl: store.icon),
        const SizedBox(height: StarSizes.xs),
        Text(store.name),
      ],
    );
  }
}
