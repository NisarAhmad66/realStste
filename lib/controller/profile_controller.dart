import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_state/model/profile_model.dart';
import 'package:real_state/service/service.dart';

class UserProfile extends GetxController {
  var products = <Product>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProfile();
  }

  fetchProfile() async {
    await Future.delayed(Duration(seconds: 2));
    Map data = {"userID": "62ea4c9ae0bd283ed687fa9d", "search": "All"};
    UserService().postApi("/posts/get", data).then((value) {
      log("i am controller");
      log(value);
    });
  }
}
