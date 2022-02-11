import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:livenewspro/Models/Channel.dart';
import 'package:livenewspro/Models/FavModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient {
  static var client = http.Client();

  static Future<List<Channel>> getAllChannels() async {
    String url = "https://livetvi.com/dashboard/api/ptv_all_channels";
    List<Channel> channelsList = [];
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        channelsList = channelFromJson(jsonString);
      }
    } on Exception {
      return channelsList;
    }

    return channelsList;
  }

  static Future<List<Channel>> getFav() async {
    String UID="";
    final prefs = await SharedPreferences.getInstance();
    UID = prefs.getString('userId')!;
    print(UID);
    String url = "https://livetvi.com/dashboard/api/profav_get/"+UID;
    List<Channel> channelsList = [];
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        channelsList = channelFromJson(jsonString);
      }
    } on Exception {
      return channelsList;
    }

    return channelsList;
  }


  static Future<List<Channel>> getRelated(Channel remove) async {
    String url = "https://livetvi.com/dashboard/api/ptv_all_channels";
    List<Channel> channelsList = [];
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        channelsList = channelFromJson(jsonString);

        if(channelsList.isNotEmpty){
          for (int i = 0; i < channelsList.length; i++) {
            if(channelsList[i].chName==remove.chName){
              channelsList.removeAt(i);
            }
          }
        }

        channelsList.shuffle();
        if (channelsList.length > 8) {
          List<Channel> channelsList1 = [];
          channelsList1.clear();
          for (int i = 0; i < 8; i++) {
            channelsList1.add(channelsList[i]);
          }
          channelsList.clear();
          channelsList = channelsList1;
        }
      }
    } on Exception {
      return channelsList;
    }

    return channelsList;
  }
}
