import 'package:json_annotation/json_annotation.dart';

part 'count_item.g.dart';

@JsonSerializable()
class CountItem {
  final String name;
  final int id, value;

  CountItem({required this.id, required this.name, required this.value});

  factory CountItem.fromJson(Map<String, dynamic> json) => _$CountItemFromJson(json);

  Map<String, dynamic> toJson() => _$CountItemToJson(this);
}
