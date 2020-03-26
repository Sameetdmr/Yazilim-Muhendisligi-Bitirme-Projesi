import 'package:haber_deprem_app/src/api/api_provider.dart';
import 'package:haber_deprem_app/src/model/category/topheadlinesnews/response_top_headlines_news.dart';

class ApiRepository{
  final ApiProvider _apiProvider = ApiProvider();

  Future<ResponseTopHeadlinesNews> fetchTopHeadlinesNews() => _apiProvider.getTopHeadlinesNews();

  Future<ResponseTopHeadlinesNews> fetchTopBusinessHeadlinesNews() => _apiProvider.getTopBusinessHeadlinesNews();

  Future<ResponseTopHeadlinesNews> fetchTopEntertainmentHeadlinesNews() => _apiProvider.getTopEntertainmentHeadlinesNews();

  Future<ResponseTopHeadlinesNews> fetchTopHealtHeadlinesNews() => _apiProvider.getTopHealtHeadlinesNews();

  Future<ResponseTopHeadlinesNews> fetchTopScienceHeadlinesNews() => _apiProvider.getTopScienceHeadlinesNews();

  Future<ResponseTopHeadlinesNews> fetchTopSportHeadlinesNews() => _apiProvider.getTopSportHeadlinesNews();

  Future<ResponseTopHeadlinesNews> fetchTopTechnologyHeadlinesNews() => _apiProvider.getTopTechnologyHeadlinesNews();
}