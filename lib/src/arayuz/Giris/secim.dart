import 'package:flutter/material.dart';
import '../Anasayfa/Anasayfa.dart';

class Secim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AnaSayfa();
              }));
            },
            child: Image.asset(
              "assets/images/img_haber.png",
            ),
          ),
          SizedBox(height: 30.0),
          FlatButton(
            onPressed: () {
              print("11");
            },
            child: Image.asset("assets/images/img_deprem.png"),
          ),
        ],
      ),
    );
  }
}

//Navigator.push(context,MaterialPageRoute(builder: (context) {return AnaSayfa();}));
