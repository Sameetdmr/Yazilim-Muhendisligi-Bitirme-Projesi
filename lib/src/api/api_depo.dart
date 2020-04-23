import 'package:haber_deprem_app/src/api/api_saglayici.dart';
import 'package:haber_deprem_app/src/model/category/topheadlinesnews/response_top_headlines_news.dart';

class ApiDepo{
  final ApiSaglayici _apiProvider = ApiSaglayici();

  Future<ResponseHaberBasliklari> fetchEnCokOkunanHaberler() => _apiProvider.getEnCokOkunanHaberler();

  Future<ResponseHaberBasliklari> fetchIsHaberleri() => _apiProvider.getIsHaberleri();

  Future<ResponseHaberBasliklari> fetchEglenceHaberleri() => _apiProvider.getEglenceHaberleri();

  Future<ResponseHaberBasliklari> fetchSalikHaberleri() => _apiProvider.getSaglikHaberleri();

  Future<ResponseHaberBasliklari> fetchBilimHaberleri() => _apiProvider.getBilimHaberleri();

  Future<ResponseHaberBasliklari> fetchSporHaberleri() => _apiProvider.getSporHaberleri();

  Future<ResponseHaberBasliklari> fetchTeknolojiHaberleri() => _apiProvider.getTeknolojiHaberleri();
}
