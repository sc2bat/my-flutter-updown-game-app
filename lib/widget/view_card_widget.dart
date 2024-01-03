import 'package:flutter/material.dart';
import 'package:updown_game_app/const/constants.dart';
import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/card_model.dart';

class ViewCardWidget extends StatefulWidget {
  final List<CardModel> cardList;
  final double size;
  final ScrollController scrollController;

  const ViewCardWidget({
    super.key,
    required this.cardList,
    this.size = 1.0,
    required this.scrollController,
  });

  @override
  State<ViewCardWidget> createState() => _ViewCardWidgetState();
}

class _ViewCardWidgetState extends State<ViewCardWidget> {
  int targetIndex = 0;

  @override
  Widget build(BuildContext context) {
    // logger.info('qwerasdf cart length ${widget.cardList.length}');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: CARD_WIDTH * widget.size * 2.4,
      height: CARD_HEIGHT * widget.size * 2.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: widget.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.cardList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: CARD_WIDTH * widget.size * 1.8,
                height: CARD_HEIGHT * widget.size * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54.withOpacity(0.3),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                  // color: Colors.black87,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: widget.cardList[index].isReverse
                      ? Image.network(
                          widget.cardList[index].image,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/card/back_up_126_176.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            );
          }),
    );
  }
}
