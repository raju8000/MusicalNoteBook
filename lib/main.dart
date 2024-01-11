import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musicalNoteBook/Resources/constants.dart';
import 'package:musicalNoteBook/Resources/theme_data.dart';
import 'package:musicalNoteBook/Screens/screen_add_note.dart';
import 'package:musicalNoteBook/widgets/rounded_corner_button.dart';
import 'Screens/screen_all_note.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.musical_NoteBook,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: MyHomePage(title: 'Musical NoteBook'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key,required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ScreenAllNotes(),

      floatingActionButton: RoundedCornerButton(
                 text: Strings.add_note,
                width: MediaQuery.of(context).size.width * 0.40,
                height: 50,

                onPressed: () {
                  /// Navigation code can still be improved for real application
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddNoteScreen()));
                }
      ),
    );
  }
}