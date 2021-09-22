import 'package:news_portal/Model/news_model.dart';

abstract class NewsInterface {
  Future<NewsModel> searchNews({String topic});
}
