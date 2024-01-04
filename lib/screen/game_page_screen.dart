import 'package:flutter/material.dart';
import 'package:updown_game_app/const/constants.dart';
import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/card_model.dart';
import 'package:updown_game_app/model/draw_card_model.dart';
// import 'package:updown_game_app/repository/card_repository.dart';
import 'package:updown_game_app/service/deck_service.dart';
import 'package:updown_game_app/widget/view_card_widget.dart';

class GamePageScreen extends StatefulWidget {
  const GamePageScreen({super.key});

  @override
  State<GamePageScreen> createState() => _GamePageScreenState();
}

class _GamePageScreenState extends State<GamePageScreen> {
  List<String> selectUser = [];
  List<String> compareResult = [];
  List<String> selectResult = [];
  bool _isLoading = true;

  final ScrollController _scrollResultController = ScrollController();
  final ScrollController scrollCardController = ScrollController();

  late List<CardModel> cardsList;

  @override
  void initState() {
    super.initState();
    initialData();
  }

  Future<void> initialData() async {
    _isLoading = true;
    DrawCardModel getCards = await getData();
    cardsList = getCards.cards;
    compareResult = compareCardValues(cardsList);
    _isLoading = false;
    cardsList[0].isReverse = true;
    setState(() {});
  }

  Future<DrawCardModel> getData() async {
    final deck = await DeckService().getDeckApi();
    logger.info('qwerasdf getDataTest');
    logger.info('qwerasdf ${deck.remaining}');
    final draw =
        await DeckService().getDrawCardsApi(deck, count: deck.remaining);
    return draw;
  }

  void reset() {
    selectUser = [];
    selectResult = [];
    for (CardModel card in cardsList) {
      card.isReverse = false;
    }
    initialData();
    if (scrollCardController.hasClients) {
      scrollCardController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
    setState(() {});
  }

  void scrollDown() {
    if (_scrollResultController.hasClients) {
      _scrollResultController.animateTo(
        _scrollResultController.position.maxScrollExtent + 50,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void scrollCard() {
    // logger.info('qwerasdf ScrollCard');
    if (selectResult.isEmpty) {
      cardsList[selectResult.length - 1].isReverse = true;
    }

    cardsList[selectResult.length].isReverse = true;
    setState(() {});
    if (scrollCardController.hasClients) {
      scrollCardController.animateTo(
        CARD_WIDTH * 1.8 * selectUser.length + 16.0 * selectUser.length,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  List<String> compareCardValues(List<CardModel> cards) {
    List<String> results = [];

    for (var card in cards) {
      switch (card.value) {
        case 'ACE':
          card.value = '1';
          break;
        case 'JACK':
          card.value = '11';
          break;
        case 'QUEEN':
          card.value = '12';
          break;
        case 'KING':
          card.value = '13';
          break;
        default:
          break;
      }
    }

    for (int i = 0; i < cards.length - 1; i++) {
      int currentValue = int.parse(cards[i].value);
      int nextValue = int.parse(cards[i + 1].value);

      // Compare values and determine the result
      String result;
      if (currentValue == nextValue) {
        result = 'EQUAL';
      } else if (currentValue.compareTo(nextValue) < 0) {
        result = 'UP';
      } else {
        result = 'DOWN';
      }

      results.add(result);
    }

    // logger.info('qwerasdf compareCardValues result $results');

    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Page Screen'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                reset();
              },
              child: const Icon(
                Icons.refresh,
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Mixing cards',
                    style: TextStyle(
                      fontSize: 32.0,
                    ),
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            )
          : Column(
              children: [
                ViewCardWidget(
                  cardList: cardsList,
                  scrollController: scrollCardController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200,
                    child: Column(
                      children: [
                        selectUser.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  reverse: true,
                                  controller: _scrollResultController,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemCount: selectUser.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(
                                        '${index + 1} 번째 player1 => ${selectUser[index]} | Result => ${selectResult[index]}',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: (selectResult[index] == 'GOOD')
                                              ? Colors.blue[400]
                                              : Colors.red[400],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: Text(
                                    'Click UP & DOWN !!!',
                                    style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          selectUser.add('UP');
                          (compareResult[selectUser.length - 1] ==
                                  selectUser.last)
                              ? selectResult.add('GOOD')
                              : selectResult.add('WRONG');
                          scrollDown();
                          scrollCard();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[300],
                        ),
                        child: const Text(
                          'UP',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          selectUser.add('DOWN');
                          (compareResult[selectUser.length - 1] ==
                                  selectUser.last)
                              ? selectResult.add('GOOD')
                              : selectResult.add('WRONG');
                          scrollDown();
                          scrollCard();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[300]),
                        child: const Text(
                          'DOWN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 56.0,
                ),
              ],
            ),
    );
  }
}
