import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart'; //빌드 gradle 문제있음
import 'package:just_audio/just_audio.dart';
import 'my_game.dart';

late Sprite spriteSheet;
late final AudioPlayer audioplayer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  audioplayer = AudioPlayer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GameWidget(
        game: BirdGame(),
      ),
    );
  }
}

