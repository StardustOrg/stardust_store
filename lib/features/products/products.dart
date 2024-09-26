import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stardust_store/common/widgets/dashboard/card_item.dart';
import 'package:stardust_store/common/widgets/dashboard/dynamic_table.dart';
import 'package:stardust_store/common/widgets/filter.dart';
import 'package:stardust_store/common/widgets/photocard_store/photocard.dart';
import 'package:stardust_store/common/widgets/photocard_store/photocard_grid.dart';
import 'package:stardust_store/common/widgets/photocard_store/photocard_modal.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/image_string.dart';
import 'package:stardust_store/utils/constants/sizes.dart';

void openPhotocardModal(
    {bool isEditing = false, Map<String, dynamic>? photocardData}) {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return PhotocardModal(
        isEditing: isEditing,
        photocardData: photocardData,
      );
    },
  );
}

final List<Map<String, dynamic>> photocardData = [
  {
    'imageUrl': 'assets/images/photocard.png',
    'artistName': 'JV',
    'pcName': 'JV in Korea',
    'id': '1',
    'price': 29.99,
    'unities': 3,
  },
  {
    'imageUrl': 'assets/images/photocard2.png',
    'artistName': 'Jayce',
    'pcName': 'AC/JC Season\'s',
    'id': '2',
    'price': 34.99,
    'unities': 5,
  },
  {
    'imageUrl': 'assets/images/photocard.png',
    'artistName': 'JV',
    'pcName': 'JV in Korea',
    'id': '1',
    'price': 29.99,
    'unities': 3,
  },
  {
    'imageUrl': 'assets/images/photocard2.png',
    'artistName': 'Jayce',
    'pcName': 'AC/JC Season\'s',
    'id': '2',
    'price': 34.99,
    'unities': 5,
  },
  {
    'imageUrl': 'assets/images/photocard.png',
    'artistName': 'JV',
    'pcName': 'JV in Korea',
    'id': '1',
    'price': 29.99,
    'unities': 3,
  },
  {
    'imageUrl': 'assets/images/photocard2.png',
    'artistName': 'Jayce',
    'pcName': 'AC/JC Season\'s',
    'id': '2',
    'price': 34.99,
    'unities': 5,
  },
  {
    'imageUrl': 'assets/images/photocard.png',
    'artistName': 'JV',
    'pcName': 'JV in Korea',
    'id': '1',
    'price': 29.99,
    'unities': 3,
  },
  {
    'imageUrl': 'assets/images/photocard2.png',
    'artistName': 'Jayce',
    'pcName': 'AC/JC Season\'s',
    'id': '2',
    'price': 34.99,
    'unities': 5,
  },
];

class Products extends StatelessWidget {
  Products({super.key});

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
                  'Photocards',
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
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: StarColors.bgLight,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
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
                                title: 'Photocard do mês',
                                value: 'Hanni Season\'s', // Exemplo de valor
                              ),
                            ),
                            Expanded(
                              child: CardItem(
                                title: 'Quantidade de Vendas',
                                value: '231 vendas', // Exemplo de valor
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -10,
                        left: 5,
                        child: Image.asset(
                          'assets/details/moons.png',
                          width: 60,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 200),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Primeira coluna com o texto e botão "Adicionar Mais"
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '05',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: StarColors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Impulsos',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: StarColors.black,
                              ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            // Adicione a ação do botão aqui
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              side:
                                  const BorderSide(color: StarColors.starPink),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            backgroundColor: StarColors.bgLight,
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Adicionar Mais',
                                style: TextStyle(
                                    color: StarColors.starPink,
                                    fontSize: StarSizes.fontSizeXs,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.add,
                                color: StarColors.starPink,
                                size: StarSizes.fontSizeMd,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 50),
                    // Segunda coluna com os dois botões
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Botão "Adicionar Anúncio"
                        SizedBox(
                          width: 180,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              openPhotocardModal();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(
                                    color: StarColors.starPink),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              backgroundColor: StarColors.starPink,
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Adicionar Anúncio',
                                  style: TextStyle(
                                      color: StarColors.bgLight,
                                      fontSize: StarSizes.fontSizeSm,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.add,
                                  color: StarColors.bgLight,
                                  size: StarSizes.fontSizeMd,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Botão "Adicionar Pré-venda"
                        SizedBox(
                          width: 180,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              // Adicione a ação do botão aqui
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: const BorderSide(
                                    color: StarColors.starPink),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              backgroundColor: StarColors.starPink,
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Adicionar Pré-venda',
                                  style: TextStyle(
                                      color: StarColors.bgLight,
                                      fontSize: StarSizes.fontSizeSm,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.add,
                                  color: StarColors.bgLight,
                                  size: StarSizes.fontSizeMd,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
            const SizedBox(
              height: 60,
            ),
            PhotocardGrid(photocards: photocardData)
          ],
        )),
      ),
    );
  }
}
