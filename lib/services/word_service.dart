import 'package:hive/hive.dart';
import 'package:mywords/models/word_model.dart';

import '../models/word.dart';

class WordService {
  late Box<Word> _words;

  Future<void> init() async {
    Hive.registerAdapter(WordModelAdapter());
    _words = await Hive.openBox<Word>('words');

    // await _tasks.clear();
    //
    // await _tasks.add(Task('testuser1', 'Subscribe to Flutter From Scratch', true));
    // await _tasks.add(Task('flutterfromscratch', 'Comment on the video', false));
  }

  List<Word> getWords(String name) {
    final words = _words.values.where((element) => element == name);
    return words.toList();
  }

  void addTask(String word) {
    _words.add(Word(word));
  }

  // Future<void> removeTask(final String task, final String username) async {
  //   final taskToRemove = _tasks.values.firstWhere((element) => element.task == task && element.user == username);
  //   await taskToRemove.delete();
  // }
  //
  // Future<void> updateTask(final String task, final String username) async {
  //   final taskToEdit = _tasks.values.firstWhere((element) => element.task == task && element.user == username);
  //   final index = taskToEdit.key as int;
  //   await _tasks.put(index, Task(username, task, !taskToEdit.completed));
  // }
}