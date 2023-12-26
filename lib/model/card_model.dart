// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

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
}
