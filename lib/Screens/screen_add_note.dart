import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicalNoteBook/Notifiers/notes_notifier.dart';
import 'package:musicalNoteBook/Notifiers/sound_notifier.dart';
import 'package:musicalNoteBook/Resources/colours.dart';
import 'package:musicalNoteBook/Resources/constants.dart';
import 'package:musicalNoteBook/Resources/text_style.dart';
import 'package:musicalNoteBook/extensions/widget_extension.dart';
import 'package:musicalNoteBook/local_storage/get_storage_helper.dart';
import 'package:musicalNoteBook/models/note_model.dart';
import 'package:musicalNoteBook/widgets/rounded_corner_button.dart';
import 'package:musicalNoteBook/widgets/text_field.dart';

class AddNoteScreen extends StatefulWidget {
  AddNoteScreen({this.note});
  final Note? note;

  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final noteTitleTextController = TextEditingController();
  final noteTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
   if(widget.note !=null){
     noteTitleTextController.text = widget.note!.title!;
     noteTextController.text = widget.note!.description!;
   }
  }

  @override
  void dispose() {
    noteTitleTextController.dispose();
    noteTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.add+" "+Strings.new_note),),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Consumer(builder: (_, WidgetRef ref, __) {
                return Column(
                  children: <Widget>[

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: PrimaryGreen,
                        ),
                          borderRadius: BorderRadius.all(Radius.circular(Dimensions.BUTTON_RADIUS))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                           Text(Strings.enable_sound,style: TextStyle(fontSize: Dimensions.FONT_SIZE_22),),

                          StatefulBuilder(
                            builder: (context, setState) {
                              return CupertinoSwitch(
                                  value: GetStorageHelper.getBool(Strings.isSoundEnabled),
                                  activeColor: PrimaryGreen,

                                  onChanged: (value){
                                    setState(()=>GetStorageHelper.insert(Strings.isSoundEnabled, value));
                                  }
                              );
                            }
                          ),
                        ],
                      ),
                    ),

                    15.height,

                    SimpleTextFormField(
                      hintText: Strings.note_title,
                      onChanged: ref.read(soundNotifier).handleOnChange,
                      textController: noteTitleTextController,
                      textInputAction: TextInputAction.next,
                    ),

                    10.height,

                    SimpleTextFormField(
                      hintText: Strings.write_note,
                      onChanged: ref.read(soundNotifier).handleOnChange,
                      textController: noteTextController,
                      textInputAction: TextInputAction.newline,
                      maxLine: 3,
                    ),

                    20.height,

                    RoundedCornerButton(
                        text: widget.note!=null?Strings.update:Strings.add,
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: 50,

                        onPressed: () async {
                          if(noteTitleTextController.text.isEmpty || noteTextController.text.isEmpty){
                            return;
                          }
                          if(widget.note!=null){
                            ref.read(notesProvider.notifier).updateNote(widget.note!.id!,noteTitleTextController.text.trim(), noteTextController.text.trim());
                          }
                          else {
                            ref.read(notesProvider.notifier).addNote(noteTitleTextController.text.trim(), noteTextController.text.trim());
                          }
                          Navigator.pop(context);
                        }
                    ),
                  ],
                );
              }
            ),
          )
        ],
      ),
    );
  }

}
