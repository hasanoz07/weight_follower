// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Record _$$_RecordFromJson(Map<String, dynamic> json) => _$_Record(
      weight: (json['weight'] as num).toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
      note: json['note'] as String?,
      PhotoUrl: json['PhotoUrl'] as String?,
    );

Map<String, dynamic> _$$_RecordToJson(_$_Record instance) => <String, dynamic>{
      'weight': instance.weight,
      'dateTime': instance.dateTime.toIso8601String(),
      'note': instance.note,
      'PhotoUrl': instance.PhotoUrl,
    };
