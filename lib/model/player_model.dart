// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:updown_game_app/model/card_model.dart';

class PlayerModel {
  final String name;
  List<CardModel> cards;

  PlayerModel({
    required this.name,
    this.cards = const [],
  });

  PlayerModel copyWith({
    String? name,
    List<CardModel>? cards,
  }) {
    return PlayerModel(
      name: name ?? this.name,
      cards: cards ?? this.cards,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cards': cards.map((x) => x.toMap()).toList(),
    };
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      name: map['name'] as String,
      cards: List<CardModel>.from(
        (map['cards'] as List<int>).map<CardModel>(
          (x) => CardModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerModel.fromJson(String source) =>
      PlayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PlayerModel(name: $name, cards: $cards)';

  @override
  bool operator ==(covariant PlayerModel other) {
    if (identical(this, other)) return true;

    return other.name == name && listEquals(other.cards, cards);
  }

  @override
  int get hashCode => name.hashCode ^ cards.hashCode;
}
