import 'package:flutter/material.dart';

import 'View/Home.dart';
import 'Helper/Dependies.dart'as dep;

Future<void>  main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home:  Home(),
    );
  }
}
