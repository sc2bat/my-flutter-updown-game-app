import 'package:flutter/material.dart';
import 'package:updown_game_app/const/constants.dart';
import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/card_model.dart';

class ViewCardWidget extends StatefulWidget {
  final CardModel cardModel;
  final double size;
  final bool isReverse;
  final ScrollController scrollController;

  const ViewCardWidget({
    super.key,
    required this.cardModel,
    this.size = 1.0,
    this.isReverse = false,
    required this.scrollController,
  });

  @override
  State<ViewCardWidget> createState() => _ViewCardWidgetState();
}

class _ViewCardWidgetState extends State<ViewCardWidget> {
  int targetIndex = 0;

  @override
  Widget build(BuildContext context) {
    var itemList = 56;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      width: CARD_WIDTH * widget.size * 2.2,
      height: CARD_HEIGHT * widget.size * 2.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: widget.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemList,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: CARD_WIDTH * widget.size * 1.6,
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
                  child: widget.isReverse
                      ? Image.network(
                          widget.cardModel.image,
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

class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    double speedMultiplier = 1.0;
    double velocity = position.pixels - position.extentBefore;

    if (velocity < -100.0) {
      speedMultiplier = 3.0;
    } else if (velocity > 100.0) {
      speedMultiplier = 0.5;
    }

    return offset * speedMultiplier;
  }
}
