import 'package:flutter/material.dart';

import 'Giris/giris.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Haber ve Deprem Uygulaması",
      theme: ThemeData(
        textTheme: TextTheme(
          button: TextStyle(
            color: Color(0xFFFFBD73),
          ),
        ),
      ),
      home: GirisSayfasi(),
    );
  }
}
