import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Text('Hi, Date Collector Starter!'),
      ),
    ),
  ));
}
