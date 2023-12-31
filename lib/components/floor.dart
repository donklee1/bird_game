import 'dart:ui';
import 'package:bird_game/consts/const.dart';
import 'package:flame/components.dart';

class Floor extends SpriteComponent with HasGameRef {
  double xPos = 0;
  double xSize = 0;
  double ySize = 0;

  Floor(Vector2 position,
      Vector2 size,) : super(
    position: position,
    size: size,
  );

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(
      'floor.png',
      srcPosition: Vector2(0, 0),
      srcSize: Vector2(168, 56),
    );
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final gameSize = gameRef.size; //화면크기
    xSize = gameSize.x * 2;
    ySize = xSize / 168 * 56; // 비율대로
    Vector2 floorPos = Vector2(xPos, gameSize.y - ySize * 0.25);
    sprite?.render(canvas, position: floorPos,
      size: Vector2(xSize, ySize),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (gameState) {
      case GameState.pause:
      case GameState.play:
        xPos -= (dt * 30 + GAME_SPEED);
        if (xPos.abs() >= gameRef.size.x) xPos = 0;
        break;
      case GameState.gameover:
        break;
    }
  }

  @override
  Rect toRect() {
    return Rect.fromLTWH(0, gameRef.size.y - ySize * 0.25, xSize, ySize);
  }
}