import 'dart:convert';

import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/card.dart';
import 'package:http/http.dart' as http;

class CardApiService {
  static String shuffledCardUrl =
      'deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1';
  String pickCardUrl =
      'https://deckofcardsapi.com/api/deck/deck_id/draw/?count=1';

  Future<String> getSuffledCardApi() async {
    logger.info('qwerasdf start getSuffledCardApi');
    var deckId = '';
    final response = await http.get(Uri.parse(shuffledCardUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      deckId = jsonData['deck_id'];
    }
    logger.info('qwerasdf $deckId');
    logger.info('qwerasdf done getSuffledCardApi');
    return deckId;
  }

  Future<void> getPickCardApi() async {
    logger.info('qwerasdf getPickCardApi getPickCardApi');
    Future<String> deckId = getSuffledCardApi();
    logger.info('qwerasdf $deckId');

    logger.info('qwerasdf ');
    logger.info('qwerasdf ');
    logger.info('qwerasdf done getPickCardApi getPickCardApi');
  }
}
