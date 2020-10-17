import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auth_test_app/constraint.dart';
import 'package:auth_test_app/models/ProviderTest.dart';
import 'package:auth_test_app/pages/auth.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => ProviderTest(),
      child: MyApp(),
    ));

//init app section
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData.dark().copyWith(primaryColor: ConstraintClass.mainAppColor),
      title: ConstraintClass.appName,
      home: Luncher(),
    );
  }
}
