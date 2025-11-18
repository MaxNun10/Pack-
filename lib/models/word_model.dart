class WordModel {
  final String id;
  final String foreignWord;
  final String translation;

  WordModel({
    required this.id,
    required this.foreignWord,
    required this.translation,
  });

  Map<String, dynamic> toMap() {
    return {'foreignWord': foreignWord, 'translation': translation};
  }

  factory WordModel.fromMap(String id, Map<String, dynamic> data) {
    return WordModel(
      id: id,
      foreignWord: data['foreignWord'],
      translation: data['translation'],
    );
  }
}
