import 'package:flutter/material.dart';
import 'package:latihanresponsi/page/home_page.dart';
import 'package:latihanresponsi/page/list_blogs.dart';
import 'package:latihanresponsi/page/list_news.dart';
import 'package:latihanresponsi/page/list_reports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan Responsi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}