import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: BirdGame(),
      ),
    );
  }
}

class BirdGame extends FlameGame with TapCallbacks {
  BirdGame() {}
  @override
  Future<void> onLoad() async {
    super.onLoad();
    Sprite spriteBg = await loadSprite('bg.png');
    add(SpriteComponent(sprite: spriteBg, autoResize: true));
  }
}
