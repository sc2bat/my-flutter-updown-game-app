import 'package:flutter/material.dart';
import 'package:updown_game_app/const/constants.dart';
import 'package:updown_game_app/model/card_model.dart';

class PageViewCardWidget extends StatefulWidget {
  final List<CardModel> cards;
  final double size;
  final bool isReverse;
  const PageViewCardWidget({
    super.key,
    required this.cards,
    this.size = 1.0,
    this.isReverse = false,
  });

  @override
  State<PageViewCardWidget> createState() => _PageViewCardWidgetState();
}

class _PageViewCardWidgetState extends State<PageViewCardWidget> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Scroll Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.cards.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: CARD_WIDTH * widget.size,
                    height: CARD_HEIGHT * widget.size,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.black87,
                    ),
                    child: widget.isReverse
                        ? Image.network(
                            widget.cards[index].image,
                            width: CARD_WIDTH * widget.size,
                            height: CARD_HEIGHT * widget.size,
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
          ElevatedButton(
            onPressed: () {
              if (_currentPage > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              setState(() {
                // isReverse = !isReverse;
              });
            },
            child: const Text('이전'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_currentPage < widget.cards.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: const Text('다음'),
          ),
        ],
      ),
    );
  }
}
