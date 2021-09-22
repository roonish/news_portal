import 'package:news_portal/Interface/news_interface.dart';
import 'package:news_portal/Model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_portal/api_key.dart';

// const String url =
//     "https://newsapi.org/v2/everything?apiKey=0a6da630e48246db853be9691e473eea&q=";

class NewsApi implements NewsInterface {
  final http.Client client;

  NewsApi(this.client);
  @override
  Future<NewsModel> searchNews({String topic}) async {
    String url = "https://newsapi.org/v2/everything?apiKey=$api_key&q=$topic";
    final response = await client.get(url);
    if (response.statusCode != 200) {
      throw Exception('server error');
    }
    // print('4 is api');
    // print('5 is response body from api and it is ${response.body}');
    return NewsModel.fromJson(response.body);
  }
}
