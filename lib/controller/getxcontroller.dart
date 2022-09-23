// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:categoryapp/model/dummy_model.dart';
import 'package:categoryapp/services/dummy_apirepo.dart';
import 'package:get/get.dart';

class DummyApiController extends GetxController {
  List dummyItems = [];
  late RxBool isLoading = false.obs;
  
  getDummyItems() async {
    try {
      isLoading (true);
      var response = await ApiRepo.apiGet('posts', '');
      if (response != null) {
        final result = List<Map<String, dynamic>>.from(response);
        final mapdata = result.map((e) => ApiRepoModel.fromJson(e)).toList();
        dummyItems = mapdata;
        update();
      }
    } catch (e) {
      Get.snackbar("Error Occured", e.toString());
    } 
    finally{
      isLoading(false);
    }
  }
}
