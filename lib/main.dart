import 'dart:convert';

import 'package:flutter/material.dart';

import 'CoinsInfo.dart';
import 'boxCreator.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "CrypEthio",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 3,
      ),
      body: BoxCreator(),
    ));
  }
}
