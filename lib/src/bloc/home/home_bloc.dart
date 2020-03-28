import 'package:bloc/bloc.dart';
import 'package:haber_deprem_app/src/api/api_repository.dart';
import 'package:haber_deprem_app/src/model/category/topheadlinesnews/response_top_headlines_news.dart';

abstract class DataState {}

class DataInitial extends DataState{}

class DataLoading extends DataState{}

class DataSuccess extends DataState{
  final ResponseTopHeadlinesNews data;

  DataSuccess(this.data);
}

class DataFailed extends DataState{
  final String errorMessage;

  DataFailed(this.errorMessage);
}

class DataEvent{
  final String category;

  DataEvent(this.category);
}

class HomeBloc extends Bloc<DataEvent,DataState>{
  final ApiRepository apiRepository = ApiRepository();
  @override
  // TODO: implement initialState
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async*{
    yield DataLoading();
    final categoryLowerCase = event.category.toLowerCase();
    switch(categoryLowerCase){
      case 'all':
        final data = await apiRepository.fetchTopHeadlinesNews();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'business':
        final data = await apiRepository.fetchTopBusinessHeadlinesNews();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'entertainment':
        final data = await apiRepository.fetchTopEntertainmentHeadlinesNews();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'healt':
        final data = await apiRepository.fetchTopHealtHeadlinesNews();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'science':
        final data = await apiRepository.fetchTopScienceHeadlinesNews();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'sport':
        final data = await apiRepository.fetchTopSportHeadlinesNews();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'technology':
        final data = await apiRepository.fetchTopTechnologyHeadlinesNews();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        default:
          yield DataFailed('Unkown category');
    }
  }

}