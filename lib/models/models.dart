// To parse this JSON data, do
//
//     final quranApi = quranApiFromJson(jsonString);

import 'dart:convert';

QuranApi quranApiFromJson(String str) => QuranApi.fromJson(json.decode(str));

String quranApiToJson(QuranApi data) => json.encode(data.toJson());

class QuranApi {
  int? code;
  String? status;
  String? message;
  Datum? data;

  QuranApi({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory QuranApi.fromJson(Map<String, dynamic> json) => QuranApi(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] != null ? Datum.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Datum {
  int? number;
  int? sequence;
  int? numberOfVerses;
  Name? name;
  Revelation? revelation;
  Tafsir? tafsir;

  Datum({
    this.number,
    this.sequence,
    this.numberOfVerses,
    this.name,
    this.revelation,
    this.tafsir,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name?.toJson(),
        "revelation": revelation?.toJson(),
        "tafsir": tafsir?.toJson(),
      };
}

class Name {
  String? short;
  String? long;
  Translation? transliteration;
  Translation? translation;

  Name({
    this.short,
    this.long,
    this.transliteration,
    this.translation,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromJson(json["transliteration"]),
        translation: Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration?.toJson(),
        "translation": translation?.toJson(),
      };
}

class Translation {
  String? en;
  String? id;

  Translation({
    this.en,
    this.id,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
      };
}

class Revelation {
  Arab? arab;
  En? en;
  Id? id;

  Revelation({
    this.arab,
    this.en,
    this.id,
  });

  factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: arabValues.map[json["arab"]],
        en: enValues.map[json["en"]],
        id: idValues.map[json["id"]],
      );

  Map<String, dynamic> toJson() => {
        "arab": arabValues.reverse[arab],
        "en": enValues.reverse[en],
        "id": idValues.reverse[id],
      };
}

enum Arab { ARAB, EMPTY }

final arabValues = EnumValues({"مدينة": Arab.ARAB, "مكة": Arab.EMPTY});

enum En { MECCAN, MEDINAN }

final enValues = EnumValues({"Meccan": En.MECCAN, "Medinan": En.MEDINAN});

enum Id { MADANIYYAH, MAKKIYYAH }

final idValues =
    EnumValues({"Madaniyyah": Id.MADANIYYAH, "Makkiyyah": Id.MAKKIYYAH});

class Tafsir {
  String? id;

  Tafsir({
    this.id,
  });

  factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
