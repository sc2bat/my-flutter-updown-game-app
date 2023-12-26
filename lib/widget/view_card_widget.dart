import 'package:flutter/material.dart';
import 'package:updown_game_app/const/constants.dart';
import 'package:updown_game_app/model/card_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ViewCardWidget extends StatelessWidget {
  final CardModel cardModel;
  final double size;

  const ViewCardWidget({
    super.key,
    required this.cardModel,
    this.size = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CARD_WIDTH * size,
      height: CARD_HEIGHT * size,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.black87,
      ),
      child: Image.network(
        cardModel.image,
        width: CARD_WIDTH * size,
        height: CARD_HEIGHT * size,
      ),
    );
  }
}
