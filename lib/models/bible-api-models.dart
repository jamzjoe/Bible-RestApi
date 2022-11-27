class BibleApiComModels {
  String? reference;
  List<Verses>? verses;
  String? text;
  String? translationId;
  String? translationName;
  String? translationNote;

  BibleApiComModels(
      {this.reference,
        this.verses,
        this.text,
        this.translationId,
        this.translationName,
        this.translationNote});

  BibleApiComModels.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(new Verses.fromJson(v));
      });
    }
    text = json['text'];
    translationId = json['translation_id'];
    translationName = json['translation_name'];
    translationNote = json['translation_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    data['translation_id'] = this.translationId;
    data['translation_name'] = this.translationName;
    data['translation_note'] = this.translationNote;
    return data;
  }
}

class Verses {
  String? bookId;
  String? bookName;
  int? chapter;
  int? verse;
  String? text;

  Verses({this.bookId, this.bookName, this.chapter, this.verse, this.text});

  Verses.fromJson(Map<String, dynamic> json) {
    bookId = json['book_id'];
    bookName = json['book_name'];
    chapter = json['chapter'];
    verse = json['verse'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book_id'] = this.bookId;
    data['book_name'] = this.bookName;
    data['chapter'] = this.chapter;
    data['verse'] = this.verse;
    data['text'] = this.text;
    return data;
  }
}
