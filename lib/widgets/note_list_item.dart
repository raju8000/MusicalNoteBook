import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicalNoteBook/Notifiers/notes_notifier.dart';
import 'package:musicalNoteBook/Resources/colours.dart';
import 'package:musicalNoteBook/Resources/constants.dart';
import 'package:musicalNoteBook/Resources/text_style.dart';
import 'package:musicalNoteBook/Screens/screen_add_note.dart';
import 'package:musicalNoteBook/extensions/widget_extension.dart';
import 'package:musicalNoteBook/models/note_model.dart';
import 'package:musicalNoteBook/widgets/rounded_corner_button.dart';

class NoteItem extends ConsumerWidget {
  const NoteItem({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(note.title!, style: TextStyle(
                        fontSize: Dimensions.FONT_SIZE_22,fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis,),
                  ),

                  ///Edit
                  IconButton(
                      icon: Icon(Icons.edit, color: Colors.black,),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddNoteScreen(note: note,)));
                      }),

                  ///Delete
                  IconButton(
                      icon: Icon(Icons.delete, color: Colors.red,),
                      onPressed: () {
                        confirmDialog(context, onConfirm: (){
                          ref.read(notesProvider.notifier).deleteNote(note.id!);
                          Navigator.of(context).pop();
                        });
                      }),
                ],
              ),

              Text(note.description!, style: TextStyle(
                  fontSize: Dimensions.FONT_SIZE_22),),
            ],
          ),
        ),

        Divider(height: 1, color: Colors.black,)
      ],
    );
  }


  ///Confirm delete item
  confirmDialog(BuildContext context,{required VoidCallback onConfirm}){
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return Dialog(
            insetPadding:  EdgeInsets.symmetric(horizontal: width*0.05),
            child: Container(
              width: double.infinity,
              height: height* 0.20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.BUTTON_RADIUS),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(Strings.sure_to_delete,
                    style: TextStyle(fontSize: Dimensions.FONT_SIZE_22),textAlign: TextAlign.center,),

                  20.height,
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          RoundedCornerButton(
                            width: width*0.35,
                            height: 50,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            text: Strings.no),

                        RoundedCornerButton(
                          width: width*0.35,
                          height: 50,
                          textColor: White,
                          onPressed: () {
                            onConfirm();
                          },
                          text: Strings.yes,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
