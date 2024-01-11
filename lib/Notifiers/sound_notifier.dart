import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicalNoteBook/Resources/constants.dart';
import 'package:musicalNoteBook/local_storage/get_storage_helper.dart';

final soundNotifier = ChangeNotifierProvider<SoundNotifier>((ref) {
  return SoundNotifier();
});

class SoundNotifier extends ChangeNotifier{

  late AudioPlayer player;
  String tempString = "";
  final baseAsset = "sounds/note";
  Map<String, String> keyToSoundPath = {
    'z': 'sounds/note1.wav',
    'x': 'sounds/note2.wav',
    'c': 'sounds/note3.wav',
    'v': 'sounds/note4.wav',
    'b': 'sounds/note5.wav',
    'n': 'sounds/note6.wav',
    'm': 'sounds/note7.wav',
    '1': 'sounds/note1.wav',
    '2': 'sounds/note2.wav',
    '3': 'sounds/note3.wav',
    '4': 'sounds/note4.wav',
    '5': 'sounds/note5.wav',
    '6': 'sounds/note6.wav',
    '7': 'sounds/note7.wav',
  };

  SoundNotifier(){
    player = AudioPlayer();
  }

  Future<void> _assignMelody(String character) async {
    // Generate a random sound file path or use your logic to select a sound
    String sound = keyToSoundPath[character.toLowerCase()] ?? baseAsset+'${Random().nextInt(6) + 1}.wav';
    _playSound(sound);
  }

  Future<void> _playSound(String sound) async {
    await player.stop();
    player.play(AssetSource(sound));
  }

  void handleOnChange(String text) {
    if(text.isEmpty){
      return;
    }

    if(text == tempString){
      tempString = text.substring(0,text.length-1);
      return;
    }else{
      tempString = text.substring(0,text.length-1);
    }

    final character = text.substring(text.length-1);

    if (_isAlphanumeric(character) && GetStorageHelper.getBool(Strings.isSoundEnabled)) {
      _assignMelody(character);
    }
  }

  bool _isAlphanumeric(String character) {
    return RegExp(r'^[a-zA-Z0-9]$').hasMatch(character);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}