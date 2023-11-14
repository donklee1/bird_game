import 'dart:ui';
import 'package:flame/components.dart';

class Floor extends SpriteComponent with HasGameRef {
  double xPos = 0;
  Floor();

  @override
  Future<void>? onLoad() async {
    sprite = await gameRef.loadSprite(
       'floor.png',
      //srcPosition: Vector2(0,0),
      srcSize: Vector2(168,56)
    );
    return super.onLoad();
  }
  @override
  void render(Canvas canvas) {
    final gameSize = gameRef.size; //화면크기
    double xSize = gameSize.x * 2;
    double ySize = xSize / 168 / 56; // 비율대로
    sprite?.render(canvas, position: Vector2(xPos,gameSize.y - ySize),
        size: Vector2(xSize, ySize), anchor: Anchor.center);
  }

  @override
  void update(double dt) {
    xPos -= dt * 50;
    if (xPos.abs() >= gameRef.size.x) xPos = 0;
  }
}