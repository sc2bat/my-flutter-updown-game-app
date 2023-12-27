import 'package:flutter/material.dart';
import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/card_model.dart';
import 'package:updown_game_app/model/draw_card_model.dart';
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
  DrawCardModel getCards = DrawCardModel(remaining: 1, cards: [
    CardModel(
        image: 'https://deckofcardsapi.com/static/img/0H.png',
        suit: 'HEARTS',
        value: '10')
  ]);

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    initialData();
  }

  Future<void> initialData() async {
    getCards = await getDataTest();
    compareResult = compareCardValues(getCards.cards);
    logger.info('qwerasdf $compareResult');
    logger.info('qwerasdf ${compareResult.length}');
    setState(() {});
  }

  Future<DrawCardModel> getDataTest() async {
    final deck = await DeckService().getDeckApi();
    final draw =
        await DeckService().getDrawCardsApi(deck, count: deck.remaining);
    return draw;
  }

  void reset() {
    selectUser = [];
    initialData();
    setState(() {});
  }

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 50,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
    // logger.info('qwerasdf ${_scrollController.position.pixels}');
    // logger.info('qwerasdf ${_scrollController.position.maxScrollExtent}');
  }

  List<String> compareCardValues(List<CardModel> cards) {
    List<String> results = [];

    for (int i = 0; i < cards.length - 1; i++) {
      String currentValue = cards[i].value;
      String nextValue = cards[i + 1].value;

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

    return results;
  }

  @override
  Widget build(BuildContext context) {
    CardModel dumpCard01 = CardModel(
        image: 'https://deckofcardsapi.com/static/img/0H.png',
        suit: 'HEARTS',
        value: '10');
    CardModel dumpCard02 = CardModel(
        image: 'https://deckofcardsapi.com/static/img/0H.png',
        suit: 'HEARTS',
        value: '10');

    List<CardModel> cardsList = [
      {
        "code": "2D",
        "image": "https://deckofcardsapi.com/static/img/2D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/2D.svg",
          "png": "https://deckofcardsapi.com/static/img/2D.png"
        },
        "value": "2",
        "suit": "DIAMONDS"
      },
      {
        "code": "KC",
        "image": "https://deckofcardsapi.com/static/img/KC.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/KC.svg",
          "png": "https://deckofcardsapi.com/static/img/KC.png"
        },
        "value": "KING",
        "suit": "CLUBS"
      },
      {
        "code": "9D",
        "image": "https://deckofcardsapi.com/static/img/9D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/9D.svg",
          "png": "https://deckofcardsapi.com/static/img/9D.png"
        },
        "value": "9",
        "suit": "DIAMONDS"
      },
      {
        "code": "3H",
        "image": "https://deckofcardsapi.com/static/img/3H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/3H.svg",
          "png": "https://deckofcardsapi.com/static/img/3H.png"
        },
        "value": "3",
        "suit": "HEARTS"
      },
      {
        "code": "5D",
        "image": "https://deckofcardsapi.com/static/img/5D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/5D.svg",
          "png": "https://deckofcardsapi.com/static/img/5D.png"
        },
        "value": "5",
        "suit": "DIAMONDS"
      },
      {
        "code": "QS",
        "image": "https://deckofcardsapi.com/static/img/QS.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/QS.svg",
          "png": "https://deckofcardsapi.com/static/img/QS.png"
        },
        "value": "QUEEN",
        "suit": "SPADES"
      },
      {
        "code": "0D",
        "image": "https://deckofcardsapi.com/static/img/0D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/0D.svg",
          "png": "https://deckofcardsapi.com/static/img/0D.png"
        },
        "value": "10",
        "suit": "DIAMONDS"
      },
      {
        "code": "3C",
        "image": "https://deckofcardsapi.com/static/img/3C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/3C.svg",
          "png": "https://deckofcardsapi.com/static/img/3C.png"
        },
        "value": "3",
        "suit": "CLUBS"
      },
      {
        "code": "8S",
        "image": "https://deckofcardsapi.com/static/img/8S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/8S.svg",
          "png": "https://deckofcardsapi.com/static/img/8S.png"
        },
        "value": "8",
        "suit": "SPADES"
      },
      {
        "code": "JD",
        "image": "https://deckofcardsapi.com/static/img/JD.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/JD.svg",
          "png": "https://deckofcardsapi.com/static/img/JD.png"
        },
        "value": "JACK",
        "suit": "DIAMONDS"
      },
      {
        "code": "AS",
        "image": "https://deckofcardsapi.com/static/img/AS.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/AS.svg",
          "png": "https://deckofcardsapi.com/static/img/AS.png"
        },
        "value": "ACE",
        "suit": "SPADES"
      },
      {
        "code": "KD",
        "image": "https://deckofcardsapi.com/static/img/KD.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/KD.svg",
          "png": "https://deckofcardsapi.com/static/img/KD.png"
        },
        "value": "KING",
        "suit": "DIAMONDS"
      },
      {
        "code": "0C",
        "image": "https://deckofcardsapi.com/static/img/0C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/0C.svg",
          "png": "https://deckofcardsapi.com/static/img/0C.png"
        },
        "value": "10",
        "suit": "CLUBS"
      },
      {
        "code": "QD",
        "image": "https://deckofcardsapi.com/static/img/QD.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/QD.svg",
          "png": "https://deckofcardsapi.com/static/img/QD.png"
        },
        "value": "QUEEN",
        "suit": "DIAMONDS"
      },
      {
        "code": "2S",
        "image": "https://deckofcardsapi.com/static/img/2S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/2S.svg",
          "png": "https://deckofcardsapi.com/static/img/2S.png"
        },
        "value": "2",
        "suit": "SPADES"
      },
      {
        "code": "JC",
        "image": "https://deckofcardsapi.com/static/img/JC.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/JC.svg",
          "png": "https://deckofcardsapi.com/static/img/JC.png"
        },
        "value": "JACK",
        "suit": "CLUBS"
      },
      {
        "code": "9H",
        "image": "https://deckofcardsapi.com/static/img/9H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/9H.svg",
          "png": "https://deckofcardsapi.com/static/img/9H.png"
        },
        "value": "9",
        "suit": "HEARTS"
      },
      {
        "code": "QC",
        "image": "https://deckofcardsapi.com/static/img/QC.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/QC.svg",
          "png": "https://deckofcardsapi.com/static/img/QC.png"
        },
        "value": "QUEEN",
        "suit": "CLUBS"
      },
      {
        "code": "AD",
        "image": "https://deckofcardsapi.com/static/img/aceDiamonds.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/aceDiamonds.svg",
          "png": "https://deckofcardsapi.com/static/img/aceDiamonds.png"
        },
        "value": "ACE",
        "suit": "DIAMONDS"
      },
      {
        "code": "QH",
        "image": "https://deckofcardsapi.com/static/img/QH.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/QH.svg",
          "png": "https://deckofcardsapi.com/static/img/QH.png"
        },
        "value": "QUEEN",
        "suit": "HEARTS"
      },
      {
        "code": "4D",
        "image": "https://deckofcardsapi.com/static/img/4D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/4D.svg",
          "png": "https://deckofcardsapi.com/static/img/4D.png"
        },
        "value": "4",
        "suit": "DIAMONDS"
      },
      {
        "code": "5C",
        "image": "https://deckofcardsapi.com/static/img/5C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/5C.svg",
          "png": "https://deckofcardsapi.com/static/img/5C.png"
        },
        "value": "5",
        "suit": "CLUBS"
      },
      {
        "code": "2H",
        "image": "https://deckofcardsapi.com/static/img/2H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/2H.svg",
          "png": "https://deckofcardsapi.com/static/img/2H.png"
        },
        "value": "2",
        "suit": "HEARTS"
      },
      {
        "code": "JH",
        "image": "https://deckofcardsapi.com/static/img/JH.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/JH.svg",
          "png": "https://deckofcardsapi.com/static/img/JH.png"
        },
        "value": "JACK",
        "suit": "HEARTS"
      },
      {
        "code": "7C",
        "image": "https://deckofcardsapi.com/static/img/7C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/7C.svg",
          "png": "https://deckofcardsapi.com/static/img/7C.png"
        },
        "value": "7",
        "suit": "CLUBS"
      },
      {
        "code": "6C",
        "image": "https://deckofcardsapi.com/static/img/6C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/6C.svg",
          "png": "https://deckofcardsapi.com/static/img/6C.png"
        },
        "value": "6",
        "suit": "CLUBS"
      },
      {
        "code": "5S",
        "image": "https://deckofcardsapi.com/static/img/5S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/5S.svg",
          "png": "https://deckofcardsapi.com/static/img/5S.png"
        },
        "value": "5",
        "suit": "SPADES"
      },
      {
        "code": "8C",
        "image": "https://deckofcardsapi.com/static/img/8C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/8C.svg",
          "png": "https://deckofcardsapi.com/static/img/8C.png"
        },
        "value": "8",
        "suit": "CLUBS"
      },
      {
        "code": "3S",
        "image": "https://deckofcardsapi.com/static/img/3S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/3S.svg",
          "png": "https://deckofcardsapi.com/static/img/3S.png"
        },
        "value": "3",
        "suit": "SPADES"
      },
      {
        "code": "0S",
        "image": "https://deckofcardsapi.com/static/img/0S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/0S.svg",
          "png": "https://deckofcardsapi.com/static/img/0S.png"
        },
        "value": "10",
        "suit": "SPADES"
      },
      {
        "code": "6D",
        "image": "https://deckofcardsapi.com/static/img/6D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/6D.svg",
          "png": "https://deckofcardsapi.com/static/img/6D.png"
        },
        "value": "6",
        "suit": "DIAMONDS"
      },
      {
        "code": "9S",
        "image": "https://deckofcardsapi.com/static/img/9S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/9S.svg",
          "png": "https://deckofcardsapi.com/static/img/9S.png"
        },
        "value": "9",
        "suit": "SPADES"
      },
      {
        "code": "8D",
        "image": "https://deckofcardsapi.com/static/img/8D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/8D.svg",
          "png": "https://deckofcardsapi.com/static/img/8D.png"
        },
        "value": "8",
        "suit": "DIAMONDS"
      },
      {
        "code": "7H",
        "image": "https://deckofcardsapi.com/static/img/7H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/7H.svg",
          "png": "https://deckofcardsapi.com/static/img/7H.png"
        },
        "value": "7",
        "suit": "HEARTS"
      },
      {
        "code": "3D",
        "image": "https://deckofcardsapi.com/static/img/3D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/3D.svg",
          "png": "https://deckofcardsapi.com/static/img/3D.png"
        },
        "value": "3",
        "suit": "DIAMONDS"
      },
      {
        "code": "6S",
        "image": "https://deckofcardsapi.com/static/img/6S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/6S.svg",
          "png": "https://deckofcardsapi.com/static/img/6S.png"
        },
        "value": "6",
        "suit": "SPADES"
      },
      {
        "code": "5H",
        "image": "https://deckofcardsapi.com/static/img/5H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/5H.svg",
          "png": "https://deckofcardsapi.com/static/img/5H.png"
        },
        "value": "5",
        "suit": "HEARTS"
      },
      {
        "code": "2C",
        "image": "https://deckofcardsapi.com/static/img/2C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/2C.svg",
          "png": "https://deckofcardsapi.com/static/img/2C.png"
        },
        "value": "2",
        "suit": "CLUBS"
      },
      {
        "code": "4S",
        "image": "https://deckofcardsapi.com/static/img/4S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/4S.svg",
          "png": "https://deckofcardsapi.com/static/img/4S.png"
        },
        "value": "4",
        "suit": "SPADES"
      },
      {
        "code": "8H",
        "image": "https://deckofcardsapi.com/static/img/8H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/8H.svg",
          "png": "https://deckofcardsapi.com/static/img/8H.png"
        },
        "value": "8",
        "suit": "HEARTS"
      },
      {
        "code": "6H",
        "image": "https://deckofcardsapi.com/static/img/6H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/6H.svg",
          "png": "https://deckofcardsapi.com/static/img/6H.png"
        },
        "value": "6",
        "suit": "HEARTS"
      },
      {
        "code": "KH",
        "image": "https://deckofcardsapi.com/static/img/KH.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/KH.svg",
          "png": "https://deckofcardsapi.com/static/img/KH.png"
        },
        "value": "KING",
        "suit": "HEARTS"
      },
      {
        "code": "7S",
        "image": "https://deckofcardsapi.com/static/img/7S.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/7S.svg",
          "png": "https://deckofcardsapi.com/static/img/7S.png"
        },
        "value": "7",
        "suit": "SPADES"
      },
      {
        "code": "JS",
        "image": "https://deckofcardsapi.com/static/img/JS.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/JS.svg",
          "png": "https://deckofcardsapi.com/static/img/JS.png"
        },
        "value": "JACK",
        "suit": "SPADES"
      },
      {
        "code": "4C",
        "image": "https://deckofcardsapi.com/static/img/4C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/4C.svg",
          "png": "https://deckofcardsapi.com/static/img/4C.png"
        },
        "value": "4",
        "suit": "CLUBS"
      },
      {
        "code": "AH",
        "image": "https://deckofcardsapi.com/static/img/AH.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/AH.svg",
          "png": "https://deckofcardsapi.com/static/img/AH.png"
        },
        "value": "ACE",
        "suit": "HEARTS"
      },
      {
        "code": "KS",
        "image": "https://deckofcardsapi.com/static/img/KS.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/KS.svg",
          "png": "https://deckofcardsapi.com/static/img/KS.png"
        },
        "value": "KING",
        "suit": "SPADES"
      },
      {
        "code": "0H",
        "image": "https://deckofcardsapi.com/static/img/0H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/0H.svg",
          "png": "https://deckofcardsapi.com/static/img/0H.png"
        },
        "value": "10",
        "suit": "HEARTS"
      },
      {
        "code": "7D",
        "image": "https://deckofcardsapi.com/static/img/7D.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/7D.svg",
          "png": "https://deckofcardsapi.com/static/img/7D.png"
        },
        "value": "7",
        "suit": "DIAMONDS"
      },
      {
        "code": "AC",
        "image": "https://deckofcardsapi.com/static/img/AC.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/AC.svg",
          "png": "https://deckofcardsapi.com/static/img/AC.png"
        },
        "value": "ACE",
        "suit": "CLUBS"
      },
      {
        "code": "9C",
        "image": "https://deckofcardsapi.com/static/img/9C.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/9C.svg",
          "png": "https://deckofcardsapi.com/static/img/9C.png"
        },
        "value": "9",
        "suit": "CLUBS"
      },
      {
        "code": "4H",
        "image": "https://deckofcardsapi.com/static/img/4H.png",
        "images": {
          "svg": "https://deckofcardsapi.com/static/img/4H.svg",
          "png": "https://deckofcardsapi.com/static/img/4H.png"
        },
        "value": "4",
        "suit": "HEARTS"
      }
    ].map((e) => CardModel.fromMap(e)).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Page Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 32.0,
          ),
          ViewCardWidget(cardModel: dumpCard02),
          // ViewCardWidget(cards: cardsList),
          // PageViewCardWidget(cards: cardsList),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200,
              child: Column(
                children: [
                  selectUser.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: selectUser.length,
                            itemBuilder: (BuildContext context, int index) {
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
                      : const Center(
                          child: Text(
                            'No items',
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
                    (compareResult[selectUser.length - 1] == selectUser.last)
                        ? selectResult.add('GOOD')
                        : selectResult.add('WRONG');
                    setState(() {});
                    scrollDown();
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
                    (compareResult[selectUser.length - 1] != selectUser.last)
                        ? selectResult.add('GOOD')
                        : selectResult.add('WRONG');
                    setState(() {});
                    scrollDown();
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
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  reset();
                  logger.info('qwerasdf press reset up $selectUser');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[300],
                ),
                child: const Text(
                  'RESET',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
