import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api/api_integration/api_integration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Prectic",
      home: ApiIntegration(),
    );
  }
}
