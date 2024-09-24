import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/images/photocard_image.dart';
import 'package:stardust_store/utils/constants/colors.dart';
import 'package:stardust_store/utils/constants/sizes.dart';

class Photocard extends StatelessWidget {
  const Photocard({
    super.key,
    this.imageUrl,
    this.size = StarSizes.photocardSm,
    this.unities = 1,
    required this.artistName,
    required this.pcName,
    required this.id,
    required this.price,
    this.borderColor = StarColors.textSecondary,
  });

  final double size, price;
  final int unities;
  final String? imageUrl;
  final String artistName, pcName, id;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack para sobrepor o botão "Editar" à imagem
          Stack(
            children: [
              StarPhotocardImage(
                imageUrl: imageUrl,
                size: size,
                borderColor: borderColor,
              ),
              // Botão Editar posicionado no canto superior direito
              Positioned(
                top: 8,
                right: 8,
                child: ElevatedButton(
                  onPressed: () {
                    // Adicione a ação do botão de edição aqui
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: StarColors.bgLight),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    backgroundColor: Colors.transparent,
                    elevation: 2,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Editar',
                        style: TextStyle(
                          color: StarColors.bgLight,
                          fontSize: StarSizes.fontSizeXs,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.edit_rounded,
                        color: StarColors.bgLight,
                        size: StarSizes.fontSizeMd,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: StarSizes.sm),
          SizedBox(
            width: size,
            child: Row(
              children: [
                Text(
                  artistName,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  ", $pcName",
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(height: StarSizes.xxs),
          SizedBox(
            width: size,
            child: Text(
              "$unities Unidades",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w100,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: StarSizes.xs),
          SizedBox(
            width: size,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Adicione a ação do botão aqui
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: StarColors.starBlue),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      backgroundColor: StarColors.bgLight,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Adicionar',
                          style: TextStyle(
                              color: StarColors.starBlue,
                              fontSize: StarSizes.fontSizeXs,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.add_circle_outline_rounded,
                          color: StarColors.starBlue,
                          size: StarSizes.fontSizeMd,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Adicione a ação do botão aqui
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(color: StarColors.starBlue),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      backgroundColor: StarColors.bgLight,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Impulsionar',
                          style: TextStyle(
                              color: StarColors.starBlue,
                              fontSize: StarSizes.fontSizeXs,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_circle_up_rounded,
                          color: StarColors.starBlue,
                          size: StarSizes.fontSizeMd,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
