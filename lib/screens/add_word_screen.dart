import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/word_model.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  State<AddWordScreen> createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final TextEditingController foreignCtrl = TextEditingController();
  final TextEditingController translationCtrl = TextEditingController();
  final FirestoreService service = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Додати слово")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: foreignCtrl,
              decoration: const InputDecoration(labelText: "Іноземне слово"),
            ),
            TextField(
              controller: translationCtrl,
              decoration: const InputDecoration(labelText: "Переклад"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Зберегти"),
              onPressed: () {
                final word = WordModel(
                  id: "",
                  foreignWord: foreignCtrl.text.trim(),
                  translation: translationCtrl.text.trim(),
                );

                service.addWord(word);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
