// To parse this JSON data, do
//
//     final dynamic = dynamicFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Dynamic dynamicFromJson(String str) => Dynamic.fromJson(json.decode(str));

class Dynamic {
  Dynamic({
    required this.fields,
  });

  List<Field> fields;

  factory Dynamic.fromJson(Map<String, dynamic> json) => Dynamic(
        fields: List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
      );
}

class Field {
  Field({
    required this.code,
    required this.caption,
    required this.fullCaption,
    required this.sort,
    required this.group,
    required this.initialValue,
    required this.regExp,
    required this.required,
    required this.type,
    required this.values,
  });

  String code;
  String caption;
  String fullCaption;
  int sort;
  String group;
  String initialValue;
  String regExp;
  bool required;
  String type;
  List<dynamic>? values;

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        code: json["code"],
        caption: json["caption"],
        fullCaption: json["fullCaption"],
        sort: json["sort"],
        group: json["group"],
        initialValue: json["initial_value"],
        regExp: json["regExp"],
        required: json["required"],
        type: json["type"],
        values: json["values"],
      );
}
