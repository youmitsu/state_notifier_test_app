import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final String title;
  final String url;
  final String uid;

  Item({
    @required this.uid,
    this.title,
    this.url,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
