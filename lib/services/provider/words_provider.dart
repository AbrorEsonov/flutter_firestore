import 'package:flutter/cupertino.dart';

import '../../models/word_model.dart';
import '../api/firebase_api.dart';

class WordModelsProvider extends ChangeNotifier {
  List<WordModel> _wordModels = [];

  // List<WordModel> get wordModels => _wordModels.where((WordModel) => WordModel.isDone == false).toList();

  // List<WordModel> get WordModelsCompleted =>
  //     _wordModels.where((WordModel) => WordModel.isDone == true).toList();

  void setWordModels(List<WordModel> WordModels) =>
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _wordModels = WordModels;
        notifyListeners();
      });

  void addWordModel(WordModel wordModel) => FirebaseApi.createWord(wordModel);

  void removeWordModel(WordModel wordModel) => FirebaseApi.deleteWords(wordModel);

  // bool toggleWordModelStatus(WordModel WordModel) {
  //   // WordModel.isDone = !WordModel.isDone;
  //   FirebaseApi.updateWordModel(WordModel);
  //
  //   return WordModel.isDone;
  // }

  void updateWordModel(WordModel wordModel, String word, String definition, String example) {
    wordModel.word = word;
    wordModel.definition = definition;

    FirebaseApi.updateWords(wordModel);
  }
}