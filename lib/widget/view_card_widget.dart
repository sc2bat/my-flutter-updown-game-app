import 'package:flutter/material.dart';
import 'package:updown_game_app/const/constants.dart';
import 'package:updown_game_app/model/card_model.dart';

class ViewCardWidget extends StatefulWidget {
  final CardModel cardModel;
  final double size;
  final bool isReverse;

  const ViewCardWidget({
    super.key,
    required this.cardModel,
    this.size = 1.0,
    this.isReverse = false,
  });

  @override
  State<ViewCardWidget> createState() => _ViewCardWidgetState();
}

class _ViewCardWidgetState extends State<ViewCardWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: CARD_WIDTH * widget.size * 1.4,
      height: CARD_HEIGHT * widget.size * 1.4,
      decoration: const BoxDecoration(
        border: Border(),
        // color: Colors.black87,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: widget.isReverse
            ? Image.network(
                widget.cardModel.image,
                width: CARD_WIDTH * widget.size * 1.4,
                height: CARD_HEIGHT * widget.size * 1.4,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'assets/images/card/back_up_126_176.png',
                width: CARD_WIDTH * widget.size * 1.4,
                height: CARD_HEIGHT * widget.size * 1.4,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
