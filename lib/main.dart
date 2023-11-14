import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
import 'components/bird.dart';
import 'components/floor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //BirdGame game = BirdGame();

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
  //late final AudioPlayer audioplayer = AudioPlayer();
  BirdGame();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final gameSize = gameRef.size; //화면크기
    Sprite spriteBg = await loadSprite('bg.png');
    add(SpriteComponent(sprite: spriteBg, autoResize: false, position: Vector2(0,0), size: gameSize));

    final birdSize = Vector2(BIRD_W, BIRD_H);
    final birdPos  = Vector2(gameSize.x/2.0, gameSize.y/2.0);
    add(Bird(birdPos, birdSize));

    double xSize = gameSize.x * 2;
    //double ySize = xSize / 168 * 56; // 비율대로
    final floorPos  = Vector2(0, 0);//gameSize.y - ySize*0.25);
    final floorSize = Vector2(0, 0); // --> 안보이게 함 (변칙)
    add(Floor(floorPos, floorSize));

    //audioplayer.play('bubble_pop.mp3');
  }
}
