import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mywords/models/word_model.dart';

class FirebaseApi{
  static Future<String> createWord(WordModel wordModel) async{
     final wordDoc = FirebaseFirestore.instance.collection("words").doc();

     wordModel.id = wordDoc.id;
     await wordDoc.set(wordModel.toJson());

     return wordDoc.id;
  }

  static Future<Stream<QuerySnapshot<Object?>>> fetchAllWords() async {
    List<WordModel> wordList = [];
    DocumentSnapshot documentSnapshot =
    await FirebaseFirestore.instance.collection('words').doc().get();
    Stream<QuerySnapshot> wordStream = FirebaseFirestore.instance.collection('words').snapshots();
    return wordStream;

  }

  static Stream<List> readTodos() => FirebaseFirestore.instance
      .collection('todo')
      .snapshots()
      .transform(transformer(WordModel.fromJson)
  as StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List>);

  static Future updateWords(WordModel wordModel) async {
    final docWords = FirebaseFirestore.instance.collection('words').doc(wordModel.id);

    await docWords.update(wordModel.toJson());
  }

  static Future deleteWords(WordModel wordModel) async {
    final docWords = FirebaseFirestore.instance.collection('words').doc(wordModel.id);

    await docWords.delete();
  }

  static StreamTransformer transformer(Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List>.fromHandlers(
        handleData: (QuerySnapshot <Map<String, dynamic>> data, EventSink<List> sink) {
          final snaps = data.docs.map((doc) => doc.data()).toList();
          final objects = snaps.map((json) => fromJson(json)).toList();
          sink.add(objects);
        },
      );


}