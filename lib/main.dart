import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/home/presenters/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const AppWidget()
      // ModularApp(module: AppModule(), child: const AppWidget()),
      );
}

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
