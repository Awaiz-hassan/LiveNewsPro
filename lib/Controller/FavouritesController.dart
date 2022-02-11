import 'package:get/get.dart';
import 'package:livenewspro/Client/HttpClient.dart';
import 'package:livenewspro/Constants/AppConstants.dart';
import 'package:livenewspro/Models/Channel.dart';

class FavController extends GetxController{
  var channelList = <Channel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchFav();
    super.onInit();
  }

  void fetchFav() async {
    try {
      isLoading(true);
      var channelsList = await HttpClient.getFav();
      AppConstants.refreshFavs=false;

      channelList.value = channelsList;
    } finally {
      isLoading(false);
    }
  }
}