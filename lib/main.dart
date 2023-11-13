import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/bird.dart';

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
      home: GameWidget(
        game: BirdGame(),
      ),
    );
  }
}

class BirdGame extends FlameGame with HasGameRef {
  BirdGame();
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final gameSize = gameRef.size; //화면크기

    Sprite spriteBg = await loadSprite('bg.png');
    add(SpriteComponent(sprite: spriteBg, autoResize: false, position: Vector2(0,0), size: gameSize));
    final birdSize = Vector2(BIRD_W, BIDR_H);
    final birdPos  = Vector2(gameSize.x/2.0, gameSize.y/2.0);
    add(Bird(birdPos, birdSize));
  }

}
