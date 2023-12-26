import 'package:flutter/material.dart';
import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/deck_model.dart';
import 'package:updown_game_app/service/deck_service.dart';

class GamePageScreen extends StatefulWidget {
  const GamePageScreen({super.key});

  @override
  State<GamePageScreen> createState() => _GamePageScreenState();
}

class _GamePageScreenState extends State<GamePageScreen> {
  @override
  void initState() {
    super.initState();

    getDataTest();
  }

  Future<void> getDataTest() async {
    final deck = await DeckService().getDeckApi();
    // logger.info('qwerasdf data $deck');
    // I/flutter (17853): 👻 INFO 2023-12-26 17:26:37.689649 [caller info not available] qwerasdf data DeckModel(deck_id: yu5sdbx8s6ad, shuffled: true, remaining: 52)
    final draw = await DeckService().getDrawCardsApi(deck, count: 10);
    // logger.info('qwerasdf draw $draw');
    // I/flutter (  869): 👻 INFO 2023-12-26 23:29:33.976725 [caller info not available] qwerasdf draw DrawCardModel(remaining: 42, cards: [CardModel(image: https://deckofcardsapi.com/static/img/0C.png, suit: CLUBS, value: 10), CardModel(image: https://deckofcardsapi.com/static/img/QH.png, suit: HEARTS, value: QUEEN), CardModel(image: https://deckofcardsapi.com/static/img/7S.png, suit: SPADES, value: 7), CardModel(image: https://deckofcardsapi.com/static/img/0H.png, suit: HEARTS, value: 10), CardModel(image: https://deckofcardsapi.com/static/img/9D.png, suit: DIAMONDS, value: 9), CardModel(image: https://deckofcardsapi.com/static/img/9H.png, suit: HEARTS, value: 9), CardModel(image: https://deckofcardsapi.com/static/img/3D.png, suit: DIAMONDS, value: 3), CardModel(image: https://deckofcardsapi.com/static/img/7C.png, suit: CLUBS, value: 7), CardModel(image: https://deckofcardsapi.com/static/img/6C.png, suit: CLUBS, value: 6), CardModel(image: https://deckofcardsapi.com/static/img/KC.png, suit: CLUBS, value: KING)])
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Page Screen'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 32.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {},
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
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {},
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
        ],
      ),
    );
  }
}
