part of 'words_bloc.dart';

abstract class WordsState extends Equatable {
  const WordsState();
}

class WordsInitial extends WordsState {
  @override
  List<Object> get props => [];
}
