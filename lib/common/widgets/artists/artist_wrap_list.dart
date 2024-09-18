import 'package:flutter/material.dart';
import 'package:stardust_store/common/widgets/artists/artist_cont.dart';
import 'package:stardust_store/common/widgets/section_title.dart';
import 'package:stardust_store/models/artist.dart';
import 'package:stardust_store/utils/constants/colors.dart';

class ArtistWrapList extends StatelessWidget {
  final String title;
  final List<Artist> artists;

  const ArtistWrapList({
    super.key,
    required this.title,
    required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: artists.length,
            itemBuilder: (context, index) {
              final artist = artists[index];
              return ArtistContainer(
                artist: artist,
                borderColor:
                    index.isEven ? StarColors.starPink : StarColors.starBlue,
              );
            },
          ),
        ),
      ],
    );
  }
}
