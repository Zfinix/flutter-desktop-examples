import 'package:flutter/material.dart';
import 'package:musicapp/utils/theme.dart';
import 'package:musicapp/views/ps5.dart';
import 'package:provider/provider.dart';

import 'views/netflix.dart';
import 'views/netflix_home.dart';
import 'views/provider/netflix_vm.dart';
import 'views/provider/ps5.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Ps5VM()),
        ChangeNotifierProvider(create: (context) => NetflixVM()),
      ],
      child: MaterialApp(
        title: 'musicapp',
        theme: themeData(context),
        debugShowCheckedModeBanner: false,
        color: Colors.red,
        home: NetflixHome(),
      ),
    );
  }
}
