import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_portal/Interface/news_interface.dart';
import 'package:news_portal/Model/news_model.dart';

class NewsController extends GetxController {
  //initialization and constructor
  final NewsInterface _newsInterface = Get.find<NewsInterface>();

//changing value
  Rx<NewsModel> getNewsModel = Rx<NewsModel>();
//from ui
  TextEditingController searchController = TextEditingController();
  //function to interface
  Future<void> searchData() async {
    NewsModel newsModel;
    newsModel = await _newsInterface.searchNews(topic: searchController.text);
    getNewsModel.value = newsModel;
  }
}
