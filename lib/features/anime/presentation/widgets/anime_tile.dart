import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kraken_animelist/core/constants/color_constants.dart';
import 'package:kraken_animelist/core/constants/design_constants.dart';
import 'package:kraken_animelist/core/constants/typo_constans.dart';
import 'package:kraken_animelist/core/extensions/nullable_string_extension.dart';
import 'package:kraken_animelist/core/extensions/num_extension.dart';
import 'package:kraken_animelist/features/anime/domain/entities/anime.dart';

class AnimeWidget extends StatelessWidget {
  final AnimeEntity? anime;
  final void Function(AnimeEntity anime)? onAnimePressed;

  const AnimeWidget({
    Key? key,
    this.anime,
    this.onAnimePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
            vertical: DesignConstants.kDefaultPadding8,
            horizontal: DesignConstants.kDefaultPadding16),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _buildImage(context),
            _buildTitleAndDescription(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3;
    return CachedNetworkImage(
        imageUrl: anime!.image.nullImage,
        imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(
                end: DesignConstants.kDefaultPadding16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignConstants.kRadius16),
                child: Container(
                  width: width,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: ColorConstants.kBlackColor,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
              padding: const EdgeInsetsDirectional.only(
                end: DesignConstants.kDefaultPadding16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignConstants.kRadius16),
                child: Container(
                  width: width,
                  height: double.maxFinite,
                  child: CupertinoActivityIndicator(),
                  decoration: BoxDecoration(
                    color: ColorConstants.kBlackColor,
                  ),
                ),
              ),
            ),
        errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsetsDirectional.only(
                end: DesignConstants.kDefaultPadding16,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(DesignConstants.kRadius16),
                child: Container(
                  width: width,
                  height: double.maxFinite,
                  child: Icon(Icons.error),
                  decoration: BoxDecoration(
                    color: ColorConstants.kBlackColor,
                  ),
                ),
              ),
            ));
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: DesignConstants.kDefaultPadding8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              anime!.title.nullText,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: TypoConstants.kHeadline3FontSize,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    DesignConstants.kDefaultPadding8.toPaddingSymmetricVertical,
                child: Text(
                  anime!.synopsis.nullText,
                  maxLines: 4,
                ),
              ),
            ),
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
          ],
        ),
      ),
    );
  }

  void _onTap() {
    if (onAnimePressed != null) {
      onAnimePressed!(anime!);
    }
  }
}
