import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_portal/UI/home_page.dart';

import 'initializer/get_initializer.dart';

void main() {
  appinit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
