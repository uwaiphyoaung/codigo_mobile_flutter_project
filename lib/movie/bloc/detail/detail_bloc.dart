import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:codigo_project/general/entity/movie_detail_entity.dart';
import 'package:meta/meta.dart';

import '../../../general/api/app_api.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<DetailEvent>((event, emit) {});

    on<LoadMovieDetail>((event, emit) async{
      emit(ResetState());
      try {
        final MovieDetailEntity response = await API().getMovieDetail(event.id);
        if(response != null && response.id>0) {
          emit(DetailDataState(response));
        }else{
          emit(DetailError("server"));
        }
      } on SocketException catch(_){
        emit(DetailError("connection"));
      }catch(e){
        emit(DetailError("server"));
        print(e.toString());
      }
    });
  }
}
