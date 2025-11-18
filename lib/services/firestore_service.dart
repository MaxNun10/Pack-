import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/word_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Додати слово
  Future<void> addWord(WordModel word) async {
    await _db.collection("words").add(word.toMap());
  }

  /// Отримати всі слова
  Stream<List<WordModel>> getWords() {
    return _db.collection("words").snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => WordModel.fromMap(
              doc.data() as String,
              doc.id as Map<String, dynamic>,
            ),
          )
          .toList();
    });
  }

  /// Видалити слово
  Future<void> deleteWord(String id) async {
    await _db.collection("words").doc(id).delete();
  }
}
