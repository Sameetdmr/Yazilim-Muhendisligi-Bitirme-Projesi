import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:haber_deprem_app/src/model/Kategori/Haber_Basliklari/response_top_headlines_news.dart';


class ApiSaglayici {
  final Dio _dio = Dio();
  final String _haberUrl = 'http://newsapi.org/v2/top-headlines?country=tr&apiKey=f951dd5671e341789141c38a9925a639';

  void printOutError(error, StackTrace stacktrace) {
    debugPrint('Hata Sebebi: $error stacktrace ile: $stacktrace');
    
  }

  Future<ResponseHaberBasliklari> getEnCokOkunanHaberler() async {
    try{
      final cevap = await _dio.get(_haberUrl);
      return ResponseHaberBasliklari.fromJson(cevap.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseHaberBasliklari.withError('$error');
      
    }
  }
  
  Future<ResponseHaberBasliklari> getIsHaberleri() async {
    try{
      final cevap = await _dio.get('$_haberUrl&category=business');
      return ResponseHaberBasliklari.fromJson(cevap.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseHaberBasliklari.withError('$error');
    }
  }

  Future<ResponseHaberBasliklari> getEglenceHaberleri() async {
    try{
      final cevap = await _dio.get('$_haberUrl&category=entertainment');
      return ResponseHaberBasliklari.fromJson(cevap.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseHaberBasliklari.withError('$error');
    }
  }

  Future<ResponseHaberBasliklari> getSaglikHaberleri() async {
    try{
      final cevap = await _dio.get('$_haberUrl&category=health');
      return ResponseHaberBasliklari.fromJson(cevap.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseHaberBasliklari.withError('$error');
    }
  }
  
  Future<ResponseHaberBasliklari> getBilimHaberleri() async {
    try{
      final cevap = await _dio.get('$_haberUrl&category=science');
      return ResponseHaberBasliklari.fromJson(cevap.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseHaberBasliklari.withError('$error');
    }
  }

  Future<ResponseHaberBasliklari> getSporHaberleri() async {
    try{
      final cevap = await _dio.get('$_haberUrl&category=sport');
      return ResponseHaberBasliklari.fromJson(cevap.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseHaberBasliklari.withError('$error');
    }
  }

  Future<ResponseHaberBasliklari> getTeknolojiHaberleri() async {
    try{
      final cevap = await _dio.get('$_haberUrl&category=technology');
      return ResponseHaberBasliklari.fromJson(cevap.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseHaberBasliklari.withError('$error');
    }
  }
}