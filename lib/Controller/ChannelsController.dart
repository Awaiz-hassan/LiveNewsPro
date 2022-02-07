import 'package:get/get.dart';
import 'package:livenewspro/Client/HttpClient.dart';
import 'package:livenewspro/Models/Channel.dart';

class ChannelsController extends GetxController{
  var channelList = <Channel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAllChannels();
    super.onInit();
  }

  void fetchAllChannels() async {
    try {
      isLoading(true);
      var channelsList = await HttpClient.getAllChannels();
      channelList.value = channelsList;
    } finally {
      isLoading(false);
    }
  }
}