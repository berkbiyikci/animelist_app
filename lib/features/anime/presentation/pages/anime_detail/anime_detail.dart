import 'package:flutter/material.dart';
import 'package:kraken_animelist/core/constants/color_constants.dart';
import 'package:kraken_animelist/core/constants/design_constants.dart';
import 'package:kraken_animelist/core/constants/typo_constans.dart';
import 'package:kraken_animelist/core/extensions/num_extension.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';
import 'package:kraken_animelist/features/anime/presentation/widgets/characters_slider.dart';

class AnimeDetailsView extends StatelessWidget {
  final AnimeEntity? anime;

  const AnimeDetailsView({Key? key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child:
              const Icon(Icons.chevron_left, color: ColorConstants.kBlackColor),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAnimeTitleAndDate(),
          _buildAnimeImage(),
          _buildAnimeDescription(),
          CharactersSlider(
            id: anime!.id!,
          ),
        ],
      ),
    );
  }

  Widget _buildAnimeTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DesignConstants.kDefaultPadding24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            anime!.title!,
            style: const TextStyle(
              fontSize: TypoConstants.kHeadline1FontSize,
              fontWeight: FontWeight.w900,
              color: ColorConstants.kBlackColor,
            ),
          ),

          DesignConstants.kDefaultPadding16.height,
          // DateTime
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.timeline_outlined,
                      size: DesignConstants.kButtonSize18),
                  DesignConstants.kDefaultPadding4.width,
                  Text(
                    anime!.ratingScore.toString(),
                    style: TextStyle(
                      color: ColorConstants.orangeColor.shade700,
                      fontSize: TypoConstants.kBody1FontSize,
                      fontWeight: TypoConstants.kBold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.movie_creation,
                      size: DesignConstants.kButtonSize18),
                  DesignConstants.kDefaultPadding4.width,
                  Text(
                    anime!.episodes.toString(),
                    style: TextStyle(
                      color: ColorConstants.orangeColor.shade700,
                      fontSize: TypoConstants.kBody1FontSize,
                      fontWeight: TypoConstants.kBold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimeImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(
        top: DesignConstants.kDefaultPadding16,
      ),
      child: Image.network(anime!.image!, fit: BoxFit.cover),
    );
  }

  Widget _buildAnimeDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DesignConstants.kDefaultPadding16,
          vertical: DesignConstants.kDefaultPadding24),
      child: Text(
        '${anime!.synopsis ?? ''}\n\n${anime!.genres?.map((e) => e.name).toList() ?? ''}',
        style: const TextStyle(
          fontSize: TypoConstants.kBody0FontSize,
          color: ColorConstants.kBlackColor,
        ),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
}
