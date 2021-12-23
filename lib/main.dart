import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technology_assessment/providers/main_app_provider.dart';
import 'package:technology_assessment/views/pages/home_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Initializing Providers For Application State Management ///
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainAppProvider()),
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomePage()));
  }
}
