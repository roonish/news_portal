import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_portal/UI/search_detail_page.dart';
import 'package:news_portal/controller/news_controller.dart';

const String PRIMARYCOLOR = 'primarycolor';
const String BLACKCOLOR = 'blackcolor';
const String WHITECOLOR = 'whitecolor';
const String BLUECOLOR = 'bluecolor';
const String LISTCOLOR = 'listcolor';
Map<String, Color> colors = {
  PRIMARYCOLOR: Colors.lightBlue[50],
  BLACKCOLOR: Colors.black,
  WHITECOLOR: Colors.white,
  BLUECOLOR: Colors.blueAccent.shade200,
  LISTCOLOR: Colors.blue.shade200,
};

class HomePage extends StatelessWidget {
  final NewsController _controller = Get.find<NewsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[PRIMARYCOLOR],
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Expanded(
                flex: 0,
                child: Container(
                  child: TextFormat(
                    color: colors[BLACKCOLOR],
                    fontsize: 34,
                    align: TextAlign.center,
                    fontWeight: FontWeight.bold,
                    text: 'Welcome to the Ronish NewsPortal',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextFormat(
                    color: colors[BLACKCOLOR],
                    align: TextAlign.justify,
                    fontsize: 16,
                    text:
                        'Welcome everybody, here you will find all the  latest NEWS currenlty happening in the world.Search any news you want to know about and enjoy the news. ',
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextField(
                          controller: _controller.searchController,
                          cursorColor: colors[BLACKCOLOR],
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            fontSize: 22,
                            color: colors[BLACKCOLOR],
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: colors[BLACKCOLOR],
                              ),
                              hintText: 'Search Here'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        Container(
                          child: GestureDetector(
                            onTap: () async {
                              await _controller.searchData();

                              Get.to(() => SearchDetailPage());
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.063,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueAccent.shade200,
                              ),
                              child: Center(
                                child: TextFormat(
                                  color: colors[WHITECOLOR],
                                  text: 'Search',
                                  fontsize: 25,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormat extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign align;
  const TextFormat({
    Key key,
    @required this.text,
    @required this.fontsize,
    this.align,
    this.fontWeight,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style:
          TextStyle(color: color, fontSize: fontsize, fontWeight: fontWeight),
    );
  }
}
