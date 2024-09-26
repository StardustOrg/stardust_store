import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/photocard_store/photocard.dart';
import 'package:stardust_store/utils/constants/sizes.dart';

class PhotocardGrid extends StatelessWidget {
  final List<Map<String, dynamic>> photocards;

  const PhotocardGrid({
    super.key,
    required this.photocards,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        spacing: 90, // Espaçamento horizontal entre os photocards
        runSpacing: 30, // Espaçamento vertical entre as linhas
        children: List.generate(photocards.length, (index) {
          final photocard = photocards[index];
          return Photocard(
            size: 228,
            imageUrl: photocard['imageUrl'],
            artistName: photocard['artistName'],
            pcName: photocard['pcName'],
            id: photocard['id'],
            price: photocard['price'],
            unities: photocard['unities'],
          );
        }),
      ),
    );
  }
}
