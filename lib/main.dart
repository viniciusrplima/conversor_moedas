
import 'package:conversor_moedas/app/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app/views/home_view.dart';

main() {
  runApp(ConversorApp());
}


class ConversorApp extends StatelessWidget {
  const ConversorApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), 
      home: HomeView(),
    ); 
  }
}