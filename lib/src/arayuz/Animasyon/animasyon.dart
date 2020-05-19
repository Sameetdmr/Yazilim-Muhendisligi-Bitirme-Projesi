import 'dart:async';
import 'package:flutter/material.dart';
import '../Giris/giris.dart';

class AnimasyonEkrani extends StatefulWidget {
  @override
  _AnimasyonEkraniState createState() => _AnimasyonEkraniState();
}

class _AnimasyonEkraniState extends State<AnimasyonEkrani> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 15),
        () => Navigator.push(context, MaterialPageRoute(builder: (context) {
              return GirisSayfasi();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.teal[100]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Color(0xFF2a5624),
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),
                    Text(
                      'Haberler ve Depremler yükleniyor...',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color(0xFF2a5624),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
