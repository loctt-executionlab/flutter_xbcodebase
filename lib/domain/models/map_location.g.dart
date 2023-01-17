// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapLocation _$$_MapLocationFromJson(Map<String, dynamic> json) =>
    _$_MapLocation(
      lat: (json['lat'] as num?)?.toDouble() ?? 0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_MapLocationToJson(_$_MapLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
