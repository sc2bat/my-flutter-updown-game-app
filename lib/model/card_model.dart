// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

import 'package:flutter/material.dart';

enum Suit {
  Hearts,
  Clubs,
  Diamonds,
  Spades,
  Other,
}

class CardModel {
  final String image;
  final String suit;
  final String value;
  CardModel({
    required this.image,
    required this.suit,
    required this.value,
  });

  CardModel copyWith({
    String? image,
    String? suit,
    String? value,
  }) {
    return CardModel(
      image: image ?? this.image,
      suit: suit ?? this.suit,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'suit': suit,
      'value': value,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      image: map['image'] as String,
      suit: map['suit'] as String,
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CardModel.fromJson(String source) =>
      CardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CardModel(image: $image, suit: $suit, value: $value)';

  @override
  bool operator ==(covariant CardModel other) {
    if (identical(this, other)) return true;

    return other.image == image && other.suit == suit && other.value == value;
  }

  @override
  int get hashCode => image.hashCode ^ suit.hashCode ^ value.hashCode;

  static Suit convertStringToSuit(String suit) {
    switch (suit.toUpperCase().trim()) {
      case "HEARTS":
        return Suit.Hearts;
      case "CLUBS":
        return Suit.Clubs;
      case "DIAMONDS":
        return Suit.Diamonds;
      case "SPADES":
        return Suit.Spades;
      default:
        return Suit.Other;
    }
  }

  static String convertSuitToString(Suit suit) {
    switch (suit) {
      case Suit.Hearts:
        return "HEARTS";
      case Suit.Clubs:
        return "CLUBS";
      case Suit.Diamonds:
        return "DIAMONDS";
      case Suit.Spades:
        return "SPADES";
      case Suit.Other:
        return "Other";
    }
  }

  static Color suitColor(Suit suit) {
    switch (suit) {
      case Suit.Hearts:
      case Suit.Clubs:
        return Colors.red;
      case Suit.Diamonds:
      case Suit.Spades:
      case Suit.Other:
        return Colors.black;
    }
  }
}
