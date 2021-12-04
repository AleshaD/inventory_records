// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountItem _$CountItemFromJson(Map<String, dynamic> json) => CountItem(
      id: json['id'] as int,
      name: json['name'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$CountItemToJson(CountItem instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'value': instance.value,
    };
