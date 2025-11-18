import 'package:flutter/material.dart';
import 'add_word_screen.dart';
import 'words_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Language App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Додати слово"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddWordScreen()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Список слів"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WordsListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
