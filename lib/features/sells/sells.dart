import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stardust_store/common/widgets/dashboard/card_item.dart';
import 'package:stardust_store/common/widgets/dashboard/dynamic_table.dart';
import 'package:stardust_store/common/widgets/filter.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/image_string.dart';

class Sells extends StatelessWidget {
  const Sells({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StarColors.bgLight,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, top: 50, right: 50),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Vendas',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/details/sparkles.svg',
                  height: 40,
                  color: StarColors.starBlue,
                ),
              ],
            ),
            const SizedBox(height: 60),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: StarColors.bgLight,
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
                          value: '\$120,34', // Exemplo de valor
                        ),
                      ),
                      Expanded(
                        child: CardItem(
                          title: 'Vendas da semana',
                          value: '\$1200,24', // Exemplo de valor
                        ),
                      ),
                      Expanded(
                        child: CardItem(
                          title: 'Vendas do mês',
                          value: '\$1020,34',
                          isLast: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/details/falling_sparkles.svg',
                    width: 50,
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: -10,
                  child: Image.asset(
                    StarImages.slidesDetails2,
                    width: 100,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  prefixIcon: Icon(Icons.search, color: StarColors.starPink),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: StarColors.starPink),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: StarColors.starPink),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                  child: FilterWidget(
                    filterName: 'Artista',
                    filterOptions: ['Artista 1', 'Artista 2', 'Artista 3'],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FilterWidget(
                    filterName: 'Categoria',
                    filterOptions: [
                      'Categoria 1',
                      'Categoria 2',
                      'Categoria 3'
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FilterWidget(
                    filterName: 'Membro',
                    filterOptions: ['Membro 1', 'Membro 2', 'Membro 3'],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FilterWidget(
                    filterName: 'Preço',
                    filterOptions: [], // Vazio porque usaremos RangeSlider
                    isNumeric: true,
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: FilterWidget(
                    filterName: 'Unidades',
                    filterOptions: [], // Vazio porque usaremos RangeSlider
                    isNumeric: true,
                  ),
                ),
              ],
            ),
            const DynamicDataTable(
              columns: ['Photocard(s)', 'Preço', 'Cliente', 'Data'],
              rows: [
                ['Hanni Season’s', '\$10.00', 'Alice', '2023-10-01'],
                ['Danielle Season’s', '\$15.00', 'Bob', '2023-10-02'],
                ['Minji Season’s', '\$20.00', 'Charlie', '2023-10-03'],
                ['Haerin Season’s', '\$12.00', 'David', '2023-10-04'],
                ['Hyein Season’s', '\$18.00', 'Eve', '2023-10-05'],
                ['Hanni Limited Edition', '\$25.00', 'Frank', '2023-10-06'],
                ['Danielle Limited Edition', '\$30.00', 'Grace', '2023-10-07'],
                ['Minji Limited Edition', '\$35.00', 'Hank', '2023-10-08'],
                ['Haerin Limited Edition', '\$28.00', 'Ivy', '2023-10-09'],
                ['Hyein Limited Edition', '\$32.00', 'Jack', '2023-10-10'],
              ],
            ),
          ],
        )),
      ),
    );
  }
}
