import 'package:updown_game_app/logger/logger.dart';
import 'package:updown_game_app/model/deck_model.dart';
import 'package:updown_game_app/model/draw_card_model.dart';
import 'package:updown_game_app/service/api_service.dart';
import 'package:http/http.dart' as http;

class DeckService extends ApiService {
  Future<DeckModel> getDeckApi({int deckCount = 1}) async {
    final response = await http.get(
      getUrl(
        'new/shuffle/',
        {"deckCount": deckCount},
      ),
    );

    if (response.statusCode == 200) {
      return DeckModel.fromJson(response.body);
    }
    logger.info('qwerasdf getDeckApi fail');
    throw Error();
  }

  Future<DrawCardModel> getDrawCardsApi(DeckModel deckModel,
      {int count = 1}) async {
    final response = await http.get(
      getUrl(
        '${deckModel.deck_id}/draw/',
        {"count": count},
      ),
    );

    if (response.statusCode == 200) {
      return DrawCardModel.fromJson(response.body);
    }
    logger.info('qwerasdf getDeckApi fail');
    throw Error();
  }
}
