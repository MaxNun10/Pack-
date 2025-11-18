import 'package:flutter/material.dart';
import '../models/word_model.dart';
import '../services/firestore_service.dart';

class WordTile extends StatelessWidget {
  final WordModel word;

  const WordTile({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(word.foreignWord),
      subtitle: Text(word.translation),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          FirestoreService().deleteWord(word.id);
        },
      ),
    );
  }
}
