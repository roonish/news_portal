import 'package:get/get.dart';
import 'package:news_portal/Api/news_api.dart';
import 'package:news_portal/Interface/news_interface.dart';
import 'package:http/http.dart' as http;
import 'package:news_portal/controller/news_controller.dart';

void appinit() {
  final http.Client client = http.Client();
  NewsApi newsApi = NewsApi(client);

  Get.put<NewsInterface>(newsApi);
  NewsController controller = NewsController();
  Get.put<NewsController>(controller);
}
