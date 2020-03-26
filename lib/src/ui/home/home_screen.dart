import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haber_deprem_app/src/bloc/home/home_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var strToday = getstrToday();
    var mediaQuery = MediaQuery.of(context);
    double paddingTop = mediaQuery.padding.top;
    return Scaffold(
        body: BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1F5F9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(
              top: paddingTop + 16.0,
              bottom: 16.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    WidgetTitle(strToday),
                  ],
                ),
                // To something i here
              ],
            ),
          )
        ],
      ),
    ));
  }

  String getstrToday() {
    var today = DateFormat("dd-MM-yyyy").format(DateTime.now());
    //var today = DateFormat().add_yMMMMd().format(DateTime.now());
    //var strDay = today.split(' ')[1].replaceFirst(',', '');
    /*
    if (strDay == '1') {
      strDay = strDay + 'st';
    } else if (strDay == '2') {
      strDay = strDay + 'nd';
    } else if (strDay == '3') {
      strDay = strDay + 'rd';
    } else {
      strDay = strDay + 'th';
    }
    
    var strDay = today.split(' ')[1];
    var strMonth = today.split(' ')[0];
    var strYear = today.split(' ')[2];
    */
    return '$today';
  }
}

class WidgetTitle extends StatelessWidget {
  final String strToday;

  WidgetTitle(this.strToday);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Haberler\n',
              style: Theme.of(context).textTheme.title.merge(
                    TextStyle(
                      color: Color(0xFF325384),
                    ),
                  ),
            ),
            TextSpan(
              text: strToday,
              style: Theme.of(context).textTheme.caption.merge(
                    TextStyle(
                      color: Color(0xFF325384).withOpacity(0.8),
                      fontSize: 12.0,
                    ),
                  ),
            )
          ]),
        ),
      ),
    );
  }
}
