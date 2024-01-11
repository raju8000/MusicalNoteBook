import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicalNoteBook/Resources/constants.dart';
import 'package:musicalNoteBook/local_storage/get_storage_helper.dart';
import 'package:musicalNoteBook/models/note_model.dart';
import 'package:uuid/uuid.dart';

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  return NotesNotifier();
});

class NotesNotifier extends StateNotifier<List<Note>> {
  // We initialize the list of Notes to an empty list
  NotesNotifier() : super(getLocalData());

  void addNote(String title, String description) {
    /// Add new note and update list
    Note note = Note(title: title, description: description, id: Uuid().v1());
    List<Note> notes = [...state, note];
    GetStorageHelper.insert(Strings.localNotes, Notes(notes: notes).toJson());
    state = notes;
  }
  void updateNote(String id, String title, String description) {
    /// Update note and update list
    int indexOf = state.indexWhere((element) => element.id == id);
    state[indexOf].title = title;
    state[indexOf].description = description;

    GetStorageHelper.insert(Strings.localNotes, Notes(notes: state).toJson());
    state = [...state];
  }

  void deleteNote(String id){
    state.remove(state.firstWhere((element) => element.id == id));
    GetStorageHelper.insert(Strings.localNotes, Notes(notes: state).toJson());
    state = [...state];
  }

  static List<Note> getLocalData(){
    var localData =  GetStorageHelper.getFromLocal(Strings.localNotes)??{};
    return Notes.fromJson(localData).notes;
  }
}