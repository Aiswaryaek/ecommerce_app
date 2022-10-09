import 'package:ecommerce_app/features/category.dart';
import 'package:flutter/material.dart';

import 'features/record.dart';
class FlutterBasicApp extends StatefulWidget {
  const FlutterBasicApp({Key? key}) : super(key: key);

  @override
  _FlutterBasicAppState createState() => _FlutterBasicAppState();
}

class _FlutterBasicAppState extends State<FlutterBasicApp> {
  @override
  Widget build(BuildContext context) {
    return  const Record();
  }
}
