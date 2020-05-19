import 'package:haber_deprem_app/src/api/api_deprem/deprem_model.dart';
import 'package:haber_deprem_app/src/api/api_deprem/deprem_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DepremSayfa extends StatefulWidget {
  DepremSayfa({Key key}) : super(key: key);

  @override
  _DepremSayfaState createState() => _DepremSayfaState();
}

class _DepremSayfaState extends State<DepremSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "En Son Depremler",
          style: TextStyle(
              color: Color(0xFF2a5624).withOpacity(0.5),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal[100],
      ),
      body: _buildFutureBuilder(context),
      backgroundColor: Colors.teal[100],
    );
  }

  _buildFutureBuilder(BuildContext context) {
    return FutureBuilder(
      future: DepremService().fetchDeprem(),
      builder: (BuildContext context, AsyncSnapshot<List<Deprem>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            padding: EdgeInsets.only(right: 15.0),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(
                    snapshot.data[index].yer,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal),
                  ),
                  subtitle: Text(
                    snapshot.data[index].tarih.toString() + '\nDerinlik : ' + snapshot.data[index].derinlik,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(snapshot.data[index].saat.toString()),
                  leading: CircleAvatar(
                    backgroundColor: Colors.red[200],
                    child: Text(
                      snapshot.data[index].siddet,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                    var selectedUrl =
                        "https://www.google.com/maps/search/?api=1&query=${snapshot.data[index].yer}&center${snapshot.data[index].enlem},${snapshot.data[index].boylam}";
                    var encoded = Uri.encodeFull(selectedUrl);
                    if (await canLaunch(encoded)) {
                      await launch(encoded);
                    } else {
                      throw "Konum bulumadı";
                    }
                  },
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
