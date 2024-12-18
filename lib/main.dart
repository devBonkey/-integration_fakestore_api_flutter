import 'package:flutter/material.dart';
import 'package:integration_fakestore_api_flutter/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Api',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
