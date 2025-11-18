import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../widgets/word_tile.dart';

class WordsListScreen extends StatelessWidget {
  const WordsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = FirestoreService();

    return Scaffold(
      appBar: AppBar(title: const Text("Список слів")),
      body: StreamBuilder(
        stream: service.getWords(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final words = snapshot.data!;

          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, i) {
              return WordTile(word: words[i]);
            },
          );
        },
      ),
    );
  }
}
