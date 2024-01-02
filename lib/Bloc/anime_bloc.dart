import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/Anime/anime_api.dart';
import '../Repository/ModelClass/AnimeModel.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeApi animeApi=AnimeApi();
  late AnimeModel animeModel;
  AnimeBloc() : super(AnimeInitial()) {
    on<FetchAnime>((event, emit)async {
      emit(AnimeBlocLoading());
      try{

        animeModel = await animeApi.getAnime();
        emit(AnimeBlocLoaded());
      } catch(e){
        print(e);
        emit(AnimeBlocError());}
    });
  }
}
