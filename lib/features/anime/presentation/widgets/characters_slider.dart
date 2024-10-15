import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kraken_animelist/core/constants/color_constants.dart';
import 'package:kraken_animelist/core/constants/design_constants.dart';
import 'package:kraken_animelist/core/constants/typo_constans.dart';
import 'package:kraken_animelist/core/extensions/num_extension.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/characters/characters_bloc.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/characters/characters_event.dart';
import 'package:kraken_animelist/features/anime/presentation/bloc/characters/characters_state.dart';

class CharactersSlider extends StatefulWidget {
  final int id;

  const CharactersSlider({super.key, required this.id});

  @override
  State<CharactersSlider> createState() => _CharactersSliderState();
}

class _CharactersSliderState extends State<CharactersSlider> {
  late CharactersBloc _charactersBloc;

  @override
  void initState() {
    super.initState();
    _charactersBloc = BlocProvider.of<CharactersBloc>(context);
    _charactersBloc.add(GetCharacters(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (_, state) {
        if (state is CharactersLoading && state.characters == null) {
          return const Center(child: CupertinoActivityIndicator());
        }

        if (state is CharactersError) {
          return const Center(child: Icon(Icons.refresh));
        }

        if (state is CharactersDone) {
          return SizedBox(
            height: DesignConstants.kCharacterSliderHeight,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: DesignConstants.kDefaultPadding16),
              itemCount: state.characters!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final character = state.characters![index];
                return Padding(
                  padding:
                      EdgeInsets.only(right: DesignConstants.kDefaultPadding16),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(DesignConstants.kRadius16),
                        child: Image.network(
                          character.image!,
                          width: DesignConstants.kCharacterCardSize,
                          height: DesignConstants.kCharacterCardSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                      DesignConstants.kDefaultPadding8.height,
                      Text(
                        character.name!,
                        style: const TextStyle(
                          fontSize: TypoConstants.kBody1FontSize,
                          color: ColorConstants.kBlackColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
