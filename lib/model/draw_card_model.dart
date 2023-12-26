// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:updown_game_app/model/card_model.dart';

class DrawCardModel {
  final int remaining;
  final List<CardModel> cards;

  DrawCardModel({
    required this.remaining,
    this.cards = const [],
  });

  DrawCardModel copyWith({
    int? remaining,
    List<CardModel>? cards,
  }) {
    return DrawCardModel(
      remaining: remaining ?? this.remaining,
      cards: cards ?? this.cards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'remaining': remaining,
      'cards': cards.map((x) => x.toMap()).toList(),
    };
  }

  factory DrawCardModel.fromMap(Map<String, dynamic> map) {
    return DrawCardModel(
      remaining: map['remaining'] as int,
      cards: List<CardModel>.from(
        (map['cards'] as List<int>).map<CardModel>(
          (x) => CardModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DrawCardModel.fromJson(String source) =>
      DrawCardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DrawCardModel(remaining: $remaining, cards: $cards)';

  @override
  bool operator ==(covariant DrawCardModel other) {
    if (identical(this, other)) return true;

    return other.remaining == remaining && listEquals(other.cards, cards);
  }

  @override
  int get hashCode => remaining.hashCode ^ cards.hashCode;
}
