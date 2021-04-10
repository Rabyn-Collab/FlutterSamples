import 'package:flutter/material.dart';
import 'package:flutter_app_some/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      title: 'News Api',
        home: MyHomePage()
    );
  }
}
