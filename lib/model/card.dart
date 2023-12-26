// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Card {
  String code;
  String image;
  String value;
  String suit;
  Card({
    required this.code,
    required this.image,
    required this.value,
    required this.suit,
  });

  Card copyWith({
    String? code,
    String? image,
    String? value,
    String? suit,
  }) {
    return Card(
      code: code ?? this.code,
      image: image ?? this.image,
      value: value ?? this.value,
      suit: suit ?? this.suit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'image': image,
      'value': value,
      'suit': suit,
    };
  }

  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      code: map['code'] as String,
      image: map['image'] as String,
      value: map['value'] as String,
      suit: map['suit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Card.fromJson(String source) =>
      Card.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Card(code: $code, image: $image, value: $value, suit: $suit)';
  }

  @override
  bool operator ==(covariant Card other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.image == image &&
        other.value == value &&
        other.suit == suit;
  }

  @override
  int get hashCode {
    return code.hashCode ^ image.hashCode ^ value.hashCode ^ suit.hashCode;
  }
}
