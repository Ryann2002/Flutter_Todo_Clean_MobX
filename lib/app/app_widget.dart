import 'package:flutter/material.dart';
import 'package:flutter_todo/app/home/presenters/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
