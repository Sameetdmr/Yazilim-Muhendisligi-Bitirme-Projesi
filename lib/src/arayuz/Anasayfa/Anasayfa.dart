import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haber_deprem_app/src/bloc/home/home_bloc.dart';
import 'package:haber_deprem_app/src/model/Kategori/category.dart';
import 'package:haber_deprem_app/src/model/Kategori/Haber_Basliklari/response_top_headlines_news.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stringTarih = getTarih();
    var mediaQuery = MediaQuery.of(context);
    double paddingTop = mediaQuery.padding.top;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        key: scaffoldState,
        body: BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.teal[100], //Değişti
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30), // Değişti
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
                        BaslikWidget(stringTarih),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    KategoriWidget(),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              _SonHaberlerEkleme(context),
              _SonHaberlerAltYaziEkleme(context),
              Expanded(
                child: TumHaberlerWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _SonHaberlerAltYaziEkleme(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'En popüler haberler',
        style: Theme.of(context).textTheme.subtitle.merge(
              TextStyle(
                color: Color(0xFF2a5624).withOpacity(0.5),
              ),
            ),
      ),
    );
  }

  Widget _SonHaberlerEkleme(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Son Haberler',
        style: Theme.of(context).textTheme.title.merge(
              TextStyle(
                color: Color(0xFF2a5624),
              ),
            ),
      ),
    );
  }

  String getTarih() {
    var tarih = DateFormat("dd-MM-yyyy").format(DateTime.now());
    return '$tarih';
  }
}

class BaslikWidget extends StatelessWidget {
  final String stringTarih;

  BaslikWidget(this.stringTarih);
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
                      color: Color(0xFF2a5624),
                    ),
                  ),
            ),
            TextSpan(
              text: stringTarih,
              style: Theme.of(context).textTheme.caption.merge(
                    TextStyle(
                      color: Color(0xFF2a5624).withOpacity(0.5),
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

class KategoriWidget extends StatefulWidget {
  @override
  _KategoriWidgetState createState() => _KategoriWidgetState();
}

class _KategoriWidgetState extends State<KategoriWidget> {
  final listCategories = [
    Category('', 'Hepsi'),
    Category('assets/images/img_is.jpg', 'İş'),
    Category('assets/images/img_eglence.jpg', 'Eğlence'),
    Category('assets/images/img_saglik.png', 'Sağlık'),
    Category('assets/images/img_bilim.png', 'Bilim'),
    Category('assets/images/img_spor.jpg', 'Spor'),
    Category('assets/images/img_teknoloji.png', 'Teknoloji'),
  ];
  int indexSelectedCategory = 0;
  @override
  void initState() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(DataEvent(listCategories[indexSelectedCategory].title));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      height: 70.0,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category itemCategory = listCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: index == listCategories.length - 1 ? 16.0 : 0.0,
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSelectedCategory = index;
                      homeBloc.add(DataEvent(
                          listCategories[indexSelectedCategory].title));
                    });
                  },
                  child: index == 0
                      ? Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF2a5624),
                            border: indexSelectedCategory == index
                                ? Border.all(color: Colors.white, width: 2.0)
                                : null,
                          ),
                          child:
                              Icon(Icons.wifi_tethering, color: Colors.white),
                        )
                      : Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(itemCategory.image),
                              fit: BoxFit.cover,
                            ),
                            border: indexSelectedCategory == index
                                ? Border.all(
                                    color: Colors.teal,
                                    width: 2.0,
                                  )
                                : null,
                          ),
                        ),
                ),
                SizedBox(height: 8.0),
                Text(
                  itemCategory.title,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFF2a5624),
                      fontWeight: indexSelectedCategory == index
                          ? FontWeight.bold
                          : FontWeight.normal),
                )
              ],
            ),
          );
        },
        itemCount: listCategories.length,
      ),
    );
  }
}

class TumHaberlerWidget extends StatefulWidget {
  @override
  _TumHaberlerWidgetState createState() => _TumHaberlerWidgetState();
}

class _TumHaberlerWidgetState extends State<TumHaberlerWidget> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);
    return Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
          bottom: mediaQuery.padding.bottom + 16.0,
        ),
        child: BlocListener<HomeBloc, DataState>(
          listener: (context, state) {
            if (state is DataFailed) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          child: BlocBuilder(
            bloc: homeBloc,
            builder: (context, state) {
              return _buildWidgetContentLatestNews(state, mediaQuery);
            },
          ),
        ));
  }

  Widget _buildWidgetContentLatestNews(
      DataState state, MediaQueryData mediaQuery) {
    if (state is DataLoading) {
      return Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator(
              backgroundColor: Colors.teal[100],
            )
            : CupertinoActivityIndicator(),
      );
    } else if (state is DataSuccess) {
      ResponseHaberBasliklari data = state.data;
      return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          Article itemArticle = data.articles[index];
          if (index == 0) {
            return Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    itemArticle.urlToImage,
                    height: 200.0,
                    width: mediaQuery.size.width,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(itemArticle.url)) {
                      await launch(itemArticle.url);
                    } else {
                      scaffoldState.currentState.showSnackBar(SnackBar(
                        content: Text('Haber Başlatılamadı'),
                      ));
                    }
                  },
                  child: Container(
                    width: mediaQuery.size.width,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.0)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.0,
                          0.9,
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10.0, right: 10.0),
                      child: Text(
                        itemArticle.title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 4.0, right: 10.0),
                      child: Wrap(
                        children: <Widget>[
                          Icon(
                            Icons.launch,
                            color: Colors.white.withOpacity(0.5),
                            size: 12.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '${itemArticle.source.name}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 10.0,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return GestureDetector(
              onTap: () async {
                if (await canLaunch(itemArticle.url)) {
                  await launch(itemArticle.url);
                }
              },
              child: Container(
                width: mediaQuery.size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 45.0, // Değişti
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              itemArticle.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF2a5624),
                                  fontWeight: FontWeight.w400),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.launch,
                                  size: 10.0,
                                  color: Color(0xFF2a5624).withOpacity(0.5),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  itemArticle.source.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: itemArticle.urlToImage != null
                            ? Image.network(
                                itemArticle.urlToImage,
                                width: 45.0,
                                height: 45.0,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/img_bulunumadi.jpg',
                                width: 45.0,
                                height: 45.0,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Color(0xFFBDCDDE),
            thickness: 2.0,
          );
        },
        itemCount: data.articles.length,
      );
    } else {
      return Container(
        child: Center(child: Text('Data başarısız')),
      );
    }
  }
}
