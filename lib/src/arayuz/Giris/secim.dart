import 'package:flutter/material.dart';
import '../Anasayfa/Anasayfa.dart';
import '../Deprem/deprem.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DepremSayfa();
              }));
            },
            child: Image.asset("assets/images/img_deprem.png"),
          ),
          SizedBox(height: 30.0),
          Text(
            'Lütfen görüntülemek istediğiniz alanı seçiniz...',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Color(0xFF2a5624)
            ),
            
            
          )
        ],
      ),
    );
  }
}

//Navigator.push(context,MaterialPageRoute(builder: (context) {return AnaSayfa();}));
