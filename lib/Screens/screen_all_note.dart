import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicalNoteBook/Notifiers/notes_notifier.dart';
import 'package:musicalNoteBook/Resources/constants.dart';
import 'package:musicalNoteBook/Resources/text_style.dart';
import 'package:musicalNoteBook/models/note_model.dart';
import 'package:musicalNoteBook/widgets/note_list_item.dart';

class ScreenAllNotes extends StatelessWidget {
  const ScreenAllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Consumer(
              builder: (_, WidgetRef ref, __) {
                final List<Note> notes = ref.watch(notesProvider);
              return notes.isNotEmpty?
                Expanded(
                  child: ListView.builder(
                  itemCount: notes.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return NoteItem(note: notes[index]);
                  }
              ),
                ):
              Expanded(
                  child: Center(child: Text(Strings.no_Notes_Found,style: TextStyle(fontSize: Dimensions.FONT_SIZE_22,fontWeight: FontWeight.bold),))
              );

            }
          ),
        ],
      ),
    );
  }
}
