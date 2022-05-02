// class ChuckNorris {
//   String iconUrl;
//   String value;
//   String url;
//   String id;
//
//   ChuckNorris(this.url, this.iconUrl, this.value, this.id);
//
//
//
//   // ChuckNorris.fromJson(Map<String, dynamic> json)
//   //     : url = json['url'],
//   //       iconUrl = json['iconUrl'],
//   //       value = json['value'],
//   //       id = json['id'];
//   // Map<String, dynamic> toJson() =>
//   //     {'id': id, 'value': value, 'url': url, 'iconUrl': iconUrl};
// }

// To parse this JSON data, do
//
//     final chuckNorris = chuckNorrisFromJson(jsonString);

import 'dart:convert';

ChuckNorris chuckNorrisFromJson(String str) =>
    ChuckNorris.fromJson(json.decode(str));

String chuckNorrisToJson(ChuckNorris data) => json.encode(data.toJson());

class ChuckNorris {
  ChuckNorris({
    required this.iconUrl,
    required this.id,
    required this.url,
    required this.value,
  });

  String iconUrl;
  String id;
  String url;
  String value;

  factory ChuckNorris.fromJson(Map<String, dynamic> json) => ChuckNorris(
        iconUrl: json["icon_url"],
        id: json["id"],
        url: json["url"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "id": id,
        "url": url,
        "value": value,
      };
}
