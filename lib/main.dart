import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stay_home/models/world_data.dart';
import 'package:stay_home/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WorldData>(
      create: (context) => WorldData(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
