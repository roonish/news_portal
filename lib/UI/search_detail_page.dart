import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/Model/articles_model.dart';
import 'package:news_portal/UI/home_page.dart';
import 'package:news_portal/controller/news_controller.dart';

class SearchDetailPage extends StatelessWidget {
  final NewsController _controller = Get.find<NewsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[PRIMARYCOLOR],
      appBar: AppBar(
        leading: IconButton(
          color: colors[BLACKCOLOR],
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: colors[PRIMARYCOLOR],
        elevation: 0,
        title: TextFormat(
          color: colors[BLACKCOLOR],
          text:
              'Search Result about ${_controller.searchController.text.capitalize}',
          fontsize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        child: Obx(
          () => ListView.builder(
            itemCount: _controller.getNewsModel.value.articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ListLayout(
                newsArticles: _controller.getNewsModel.value.articles[index],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ListLayout extends StatelessWidget {
  final NewsArticles newsArticles;

  const ListLayout({
    Key key,
    this.newsArticles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colors[LISTCOLOR],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormat(
            text: newsArticles.title,
            fontsize: 25,
            fontWeight: FontWeight.bold,
            align: TextAlign.justify,
            color: colors[BLACKCOLOR],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextFormat(
            text: newsArticles.publishedAt,
            fontsize: 15,
            fontWeight: FontWeight.bold,
            align: TextAlign.right,
            color: colors[BLACKCOLOR],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            // height: MediaQuery.of(context).size.height * 0.5,
            //  width: MediaQuery.of(context).size.width * 0.4,
            child: Image.network(newsArticles.urlToImage),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Container(
            child: TextFormat(
              text: newsArticles.description,
              fontsize: 18,
              //  fontWeight: FontWeight.bold,
              align: TextAlign.justify,
              color: colors[BLACKCOLOR],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
