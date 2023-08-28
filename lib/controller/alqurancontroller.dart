import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:alquran/controller/typedef.dart';
import 'package:alquran/models/models.dart';
import 'package:get/get.dart';

class alquran extends GetxController {
  var isLoading = true.obs;
  Future<List<Datum>> getdata() async {
    Uri url = Uri.parse("https://api.quran.gading.dev/surah");
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsondata =
            (jsonDecode(response.body) as Map<String, dynamic>)["data"];

        if (jsondata == null) {
          print("API response data is null");
          return [];
        } else {
          return jsondata.map((element) => Datum.fromJson(element)).toList();
        }
      } else {
        print("HTTP request failed with status: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("An error occurred: $e");
      return [];
    }
  }
   tes(){
    Get.defaultDialog(
      title: 'OnGoing',
      middleText: 'Fitur Otw bangda'
    );
   }
}
