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
        game: RacingGame(),
      ),
    );
  }
}

class RacingGame extends FlameGame with TapCallbacks  {
  late Player player;
  @override
  Future<void> onLoad() async {
    player = Player(
      position: Vector2(size.x * 0.25, size.y - 20),
    );
    add(player);
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    if (!event.handled) {
      final touchPoint = event.canvasPosition;
      if (touchPoint.x > size.x / 2) {
        player.position = Vector2(size.x * 0.75, size.y - 20);
      } else {
        player.position = Vector2(size.x * 0.25, size.y - 20);
      }
    }
  }
}

class Player extends RectangleComponent {
  static const playerSize = 96.0;
  Player({required position})
      : super(
    position: position,
    size: Vector2.all(playerSize),
    anchor: Anchor.bottomCenter,
  );
}