import 'package:bloc/bloc.dart';
import 'package:haber_deprem_app/src/api/api_depo.dart';
import 'package:haber_deprem_app/src/model/Kategori/Haber_Basliklari/response_top_headlines_news.dart';

abstract class DataState {}

class DataInitial extends DataState{}

class DataLoading extends DataState{}

class DataSuccess extends DataState{
  final ResponseHaberBasliklari data;

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
  final ApiDepo apidepo = ApiDepo();
  @override
  // TODO: implement initialState
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async*{
    yield DataLoading();
    final categoryLowerCase = event.category.toLowerCase();
    switch(categoryLowerCase){
      case 'hepsi':
        final data = await apidepo.fetchEnCokOkunanHaberler();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'iş':
        final data = await apidepo.fetchIsHaberleri();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'eğlence':
        final data = await apidepo.fetchEglenceHaberleri();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'sağlık':
        final data = await apidepo.fetchSalikHaberleri();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'bilim':
        final data = await apidepo.fetchBilimHaberleri();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'spor':
        final data = await apidepo.fetchSporHaberleri();
        if(data.error==null){
          yield DataSuccess(data);
        }else{
          yield DataFailed('${data.error}');
        }
        break;
        case 'teknoloji':
        final data = await apidepo.fetchTeknolojiHaberleri();
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