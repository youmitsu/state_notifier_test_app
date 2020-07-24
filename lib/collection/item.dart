import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final String title;
  final String url;
  final String uid;
  final DateTime createdAt;

  String get displayCreatedAt {
    if (createdAt == null) return '';
    return '${createdAt.year}年${createdAt.month}月${createdAt.day}日 ${createdAt.hour}:${createdAt.minute}';
  }

  Item({
    @required this.uid,
    this.title,
    this.url,
    this.createdAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
