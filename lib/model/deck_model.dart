// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class DeckModel {
  final String deck_id;
  final bool shuffled;
  final int remaining;
  DeckModel({
    required this.deck_id,
    required this.shuffled,
    required this.remaining,
  });

  DeckModel copyWith({
    String? deck_id,
    bool? shuffled,
    int? remaining,
  }) {
    return DeckModel(
      deck_id: deck_id ?? this.deck_id,
      shuffled: shuffled ?? this.shuffled,
      remaining: remaining ?? this.remaining,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deck_id': deck_id,
      'shuffled': shuffled,
      'remaining': remaining,
    };
  }

  factory DeckModel.fromMap(Map<String, dynamic> map) {
    return DeckModel(
      deck_id: map['deck_id'] as String,
      shuffled: map['shuffled'] as bool,
      remaining: map['remaining'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeckModel.fromJson(String source) =>
      DeckModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DeckModel(deck_id: $deck_id, shuffled: $shuffled, remaining: $remaining)';

  @override
  bool operator ==(covariant DeckModel other) {
    if (identical(this, other)) return true;

    return other.deck_id == deck_id &&
        other.shuffled == shuffled &&
        other.remaining == remaining;
  }

  @override
  int get hashCode => deck_id.hashCode ^ shuffled.hashCode ^ remaining.hashCode;
}
