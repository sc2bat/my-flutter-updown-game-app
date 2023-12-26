import 'package:flutter/material.dart';
import 'package:updown_game_app/logger/logger.dart';
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
    final data = await DeckService().getDeckApi();
    logger.info('qwerasdf data $data');
    // I/flutter (17853): 👻 INFO 2023-12-26 17:26:37.689649 [caller info not available] qwerasdf data DeckModel(deck_id: yu5sdbx8s6ad, shuffled: true, remaining: 52)
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
