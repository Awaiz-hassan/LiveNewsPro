
import 'package:get/get.dart';
import 'package:livenewspro/Models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

class UserDetailsController extends GetxController{



  var error="".obs;
  var name="".obs;
  var email="".obs;
  var packageType="".obs;
  var userID="".obs;
  var price="".obs;
  var expDate ="".obs;
  var isLoading=false.obs;

  @override
  void onInit() {
    userDetails();
    super.onInit();
  }



  userDetails() async {
    isLoading(true);
    String userId = "";
    final prefs = await SharedPreferences.getInstance();
    final bool? logged = prefs.getBool('logged');
    if (logged != null) {
      if (logged) {
        final String? userIdFromSharedPrefs = prefs.getString('userId');
        if (userIdFromSharedPrefs != null) {
            userId = userIdFromSharedPrefs;
        }
      } else {
        error("User not logged in");
      }
    } else {
      error("User not logged in");
    }

    var client = http.Client();
    String url = "https://livenewspro.com/wp-json/mp/v1/members/" + userId;
    UserData userData;
    try {
      var response = await client.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'MEMBERPRESS-API-KEY': 'SftrOcH824',
        },
      );
      if (response.statusCode == 200) {
        isLoading(false);

        var jsonString = response.body;
        userData = userDataFromJson(jsonString);
          userID = userData.id.toString().obs;
          price = ("\$ "+userData.recentTransactions[0].total).obs;
          expDate = userData.recentTransactions[0].expiresAt.toIso8601String().obs;
          name = (userData.firstName+" "+userData.lastName).obs;
          email = userData.email.obs;
          packageType = (userData.recentSubscriptions[0].period+
              " " +
              userData.recentSubscriptions[0].periodType).obs;
          error("");
        await prefs.setString('FirstName', userData.firstName);
        await prefs.setString('LastName', userData.lastName);
        await prefs.setString('Email', userData.email);


      } else if (response.statusCode == 404) {
        isLoading(false);
        error("User Unauthorized");
      }
    } on Exception {
      isLoading(false);
      error ("Unable to connect to server");
    }
  }

}