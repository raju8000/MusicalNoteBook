class Notes{
  List<Note> notes = [];

  Notes({required this.notes});

  Notes.fromJson(dynamic json) {
    if (json['notes'] != null) {
      json['notes'].forEach((v) {
        notes.add(Note.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notes'] = notes.map((v) => v.toJson()).toList();
    return map;
  }
}


class Note{
  String? id;
  String? title;
  String? description;

  Note({required this.id,required this.description, required this.title});

  Note.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['note'];
  }

  Map<String, String> toJson() {
    return {
      "id": id!,
      "title": title!,
      "note" : description!
    };
  }
}