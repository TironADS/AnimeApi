part of 'anime_bloc.dart';

@immutable
abstract class AnimeState {}

class AnimeInitial extends AnimeState {}
class AnimeBlocLoading extends  AnimeState {}
class AnimeBlocLoaded extends AnimeState{}
class AnimeBlocError extends AnimeState{}
