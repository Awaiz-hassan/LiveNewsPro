// To parse this JSON data, do
//
//     final channel = channelFromJson(jsonString);

import 'dart:convert';

List<Channel> channelFromJson(String str) => List<Channel>.from(json.decode(str).map((x) => Channel.fromJson(x)));

String channelToJson(List<Channel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Channel {
  Channel({
    required this.id,
    required this.chName,
    required this.chImage,
    required this.streamUrl,
    required this.decodedStream,
    required this.country,
    required this.channelDesc,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String chName;
  String chImage;
  String streamUrl;
  String decodedStream;
  String country;
  String channelDesc;
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    id: json["id"],
    chName: json["ch_name"],
    chImage: json["ch_image"],
    streamUrl: json["stream_url"],
    decodedStream: json["decoded_stream"],
    country: json["country"],
    channelDesc: json["channel_desc"],
    category: json["category"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ch_name": chName,
    "ch_image": chImage,
    "stream_url": streamUrl,
    "decoded_stream": decodedStream,
    "country": country,
    "channel_desc": channelDesc,
    "category": category,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
