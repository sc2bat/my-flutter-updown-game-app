import 'dart:convert';

import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/card.dart';
import 'package:http/http.dart' as http;

class CardApiService {
  static const baseUrl = 'https://deckofcardsapi.com/api/deck/';
  static const shuffledCardUrl =
      'deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1';
  static const pickCardUrl = 'https://deckofcardsapi.com/api/deck/';

  Uri _uri(String path, [Map<String, dynamic> params = const {}]) {
    String queryString = '';
    if (params.isNotEmpty) {
      queryString += '?';
      params.forEach((key, value) {
        queryString += '$key=${value.toString()}&';
      });
    }
    return Uri.parse('$baseUrl$path$queryString');
  }

  Future<String> getDeckIdApi() async {
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

  Future<void> getPickCardsApi() async {
    logger.info('qwerasdf getPickCardApi getPickCardApi');
    List<Card> card;

    Future<String> deckId = getDeckIdApi();
    logger.info('qwerasdf $deckId');

    final response =
        await http.get(Uri.parse('$pickCardUrl$deckId/draw/?count=1'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> cardsJson = jsonData['cards'];
      logger.info('qwerasdf cardsJson lenght ${cardsJson.length}');
      card = cardsJson.map((e) => Card.fromJson(e)).toList();
    }

    logger.info('qwerasdf done getPickCardApi getPickCardApi');
  }
}
