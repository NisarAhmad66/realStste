import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const apiUrl = "https://propertybuildapp.herokuapp.com";
  Dio dio = Dio();
  // var userData;
  // List cartList = [];

  Future postApi(String path, Map data) async {
    log("$data");
    Response response = await dio.post(apiUrl + path, data: data);
    // print(response);
    return response.data;
  }

  Future deletePost(String path, Map data) async {
    log("$data");
    Response response = await dio.delete(apiUrl + path, data: data);
    // print(response);
    return response.data;
  }

  Future postApiforImages(String path, FormData data) async {
    // log("$data");
    Response response = await dio.post(apiUrl + path, data: data);
    // print(response);
    return response.data;
  }

  Future postFromApi(String path, FormData data) async {
    log("$data");
    Response response = await dio.post(apiUrl + path, data: data);
    print(response);
    return response.data;
  }

  Future getApi(String path) async {
    Response response = await dio.get(apiUrl + path);
    // log("$response");
    // log("in get");
    return response.data;
  }

  Future updateUser(String path, var id, Map data) async {
    log("$data");

    var response = await dio.post(apiUrl + path + id, data: data);
    print(response);
    var res = json.decode(response.toString());
    return res;
  }

  Future getAuctionMarketById(
    String path,
    var id,
  ) async {
    log("$id");

    var response = await dio.post(
      apiUrl + path + id,
    );
    print(response);
    var res = json.decode(response.toString());
    return res;
  }

  Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var d = prefs.getString('userData');
    if (d != null) {
      return jsonDecode(d);
    } else {
      return null;
    }
  }

  Future<bool> setUser(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userData', jsonEncode(user));
    await prefs.setBool('loggedIn', true);
    return true;
  }

  Future<dynamic> uploadAuctionImage(img, fileName) async {
    var url = UserService.apiUrl + 'auction/upload-auction-images';
    print(url);
    var data = {"name": fileName, "image": img};
    var resp = await this.dio.post(url, data: data);
    var d = json.decode(resp.toString());
    return d;
  }
}
