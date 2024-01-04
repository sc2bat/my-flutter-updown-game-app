import 'package:flutter/material.dart';
import 'package:updown_game_app/const/constants.dart';
import 'package:updown_game_app/model/card_model.dart';

class ViewCardWidget extends StatelessWidget {
  // final CardModel cardModel;
  final List<CardModel> cards;
  final double size;
  final bool isReverse;

  const ViewCardWidget({
    super.key,
    this.size = 1.0,
    this.isReverse = false,
    required this.cards,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: CARD_HEIGHT * 1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0), // 각 카드 사이의 간격을 조절
              child: Container(
                width: CARD_WIDTH * 1,
                height: CARD_HEIGHT * 1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.black87,
                ),
                child: isReverse
                    ? Image.network(
                        cards[index].image,
                        width: CARD_WIDTH * 1,
                        height: CARD_HEIGHT * 1,
                      )
                    : const SizedBox(
                        width: CARD_WIDTH * 1,
                        height: CARD_HEIGHT * 1,
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
