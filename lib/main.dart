import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/app_widget.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const AppWidget()
      // ModularApp(module: AppModule(), child: const AppWidget()),
      );
}
