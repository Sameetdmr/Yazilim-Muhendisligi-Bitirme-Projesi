import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:haber_deprem_app/src/model/category/topheadlinesnews/response_top_headlines_news.dart';


class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://newsapi.org/v2/top-headlines?country=tr&apiKey=f951dd5671e341789141c38a9925a639';

  void printOutError(error, StackTrace stacktrace) {
    debugPrint('Exception occured: $error with stactrace: $stacktrace');
    
  }

  Future<ResponseTopHeadlinesNews> getTopHeadlinesNews() async {
    try{
      final response = await _dio.get(_baseUrl);
      return ResponseTopHeadlinesNews.fromJson(response.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseTopHeadlinesNews.withError('$error');
      
    }
  }
  
  Future<ResponseTopHeadlinesNews> getTopBusinessHeadlinesNews() async {
    try{
      final response = await _dio.get('$_baseUrl&category=business');
      return ResponseTopHeadlinesNews.fromJson(response.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseTopHeadlinesNews.withError('$error');
    }
  }

  Future<ResponseTopHeadlinesNews> getTopEntertainmentHeadlinesNews() async {
    try{
      final response = await _dio.get('$_baseUrl&category=entertainment');
      return ResponseTopHeadlinesNews.fromJson(response.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseTopHeadlinesNews.withError('$error');
    }
  }

  Future<ResponseTopHeadlinesNews> getTopHealtHeadlinesNews() async {
    try{
      final response = await _dio.get('$_baseUrl&category=health');
      return ResponseTopHeadlinesNews.fromJson(response.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseTopHeadlinesNews.withError('$error');
    }
  }
  
  Future<ResponseTopHeadlinesNews> getTopScienceHeadlinesNews() async {
    try{
      final response = await _dio.get('$_baseUrl&category=science');
      return ResponseTopHeadlinesNews.fromJson(response.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseTopHeadlinesNews.withError('$error');
    }
  }

  Future<ResponseTopHeadlinesNews> getTopSportHeadlinesNews() async {
    try{
      final response = await _dio.get('$_baseUrl&category=sport');
      return ResponseTopHeadlinesNews.fromJson(response.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseTopHeadlinesNews.withError('$error');
    }
  }

  Future<ResponseTopHeadlinesNews> getTopTechnologyHeadlinesNews() async {
    try{
      final response = await _dio.get('$_baseUrl&category=technology');
      return ResponseTopHeadlinesNews.fromJson(response.data);
    }
    catch(error,stacktrace){
      printOutError(error, stacktrace);
      return ResponseTopHeadlinesNews.withError('$error');
    }
  }
}