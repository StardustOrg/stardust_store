import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/store/store_cont.dart';
import 'package:stardust_store/common/widgets/section_title.dart';
import 'package:stardust_store/models/store.dart';
import 'package:stardust_store/utils/constants/colors.dart';

class StoreRowList extends StatelessWidget {
  final String? title;
  final List<Store> stores;

  const StoreRowList({
    super.key,
    this.title,
    required this.stores,
    this.detailColor = StarColors.starPink,
  });

  final Color detailColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          SectionTitle(
            title: title!,
            color: detailColor,
          ),
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: stores.asMap().entries.map((entry) {
              final index = entry.key;
              final store = entry.value;
              return Row(
                children: [
                  GestureDetector(
                    onTap: () => {},
                    child: StoreContainer(store: store),
                  ),
                  if (index != stores.length - 1) const SizedBox(width: 15),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
