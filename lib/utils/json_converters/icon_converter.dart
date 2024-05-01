import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class IconConverter extends JsonConverter<Icon, String> {
  const IconConverter();

  @override
  Icon fromJson(String json) {
    return Icon(
      IconData(
        int.parse(json),
        fontFamily: 'MaterialIcons',
      ),
    );
  }

  @override
  String toJson(Icon object) {
    return object.icon!.codePoint.toString();
  }
}
