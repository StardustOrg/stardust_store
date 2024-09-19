import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_store/common/widgets/dashboard/bar_chart.dart';
import 'package:stardust_store/common/widgets/dashboard/card_item.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/image_string.dart';
import 'package:stardust_store/utils/constants/text_strings.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  final List<Map<String, dynamic>> data = List.generate(28, (index) {
    return {
      'day': index + 1,
      'value': Random().nextInt(500) + 100,
    };
  });

  @override
  Widget build(BuildContext context) {
    final Color starBlueWithOpacity = StarColors.starBlue.withOpacity(0.5);

    return Padding(
        padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Dashboard',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/details/sparkles.svg',
                  height: 40,
                  color: StarColors.starPink,
                ),
              ],
            ),
            const SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -20,
                  left: 0,
                  child: Image.asset(
                    StarImages.slidesDetails3,
                    width: 160,
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    border: Border.all(
                      color: StarColors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardItem(
                          title: 'Vendas de hoje',
                          value: '\$1,234', // Exemplo de valor
                        ),
                      ),
                      Expanded(
                        child: CardItem(
                          title: 'Photocard do dia',
                          value: 'Hanni Season’s', // Exemplo de valor
                        ),
                      ),
                      Expanded(
                        child: CardItem(
                          title: 'Artista do dia',
                          value: 'NewJeans',
                          isLast: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -10,
                  left: 10,
                  child: Image.asset(
                    StarImages.slidesDetails1,
                    width: 39,
                  ),
                ),
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Image.asset(
                    StarImages.slidesDetails2,
                    width: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: AdaptiveChart(
                    periodType: "day",
                    data: data,
                    barColor: StarColors.starPink,
                    chartType: "line",
                  ),
                ),
                const Expanded(
                  child: AdaptiveChart(
                    periodType: "week",
                    data: [
                      {'day': 1, 'value': 100},
                      {'day': 2, 'value': 200},
                      {'day': 3, 'value': 300},
                      {'day': 4, 'value': 400},
                      {'day': 5, 'value': 500},
                      {'day': 6, 'value': 600},
                      {'day': 7, 'value': 700},
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
