import 'dart:ui';
import 'package:flame/components.dart';
import '../consts/const.dart';

class Titles extends Component with HasGameRef {
  late final Sprite _getReady;
  late final Sprite _gameOver;
  double xSize = 0;
  double ySize = 0;

  Titles();

  @override
  Future<void>? onLoad() async {
    _getReady = await gameRef.loadSprite('sprites.png',
        srcPosition: Vector2(295, 59), srcSize: Vector2(92, 25));  //큰화면의 일부를 스프라이트로
    _gameOver = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(395, 59), srcSize: Vector2(96, 25));  //큰화면의 일부를 스프라이트로
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    switch (gameState) {
      case GameState.pause:
        xSize = gameRef.size.x * 0.6;
        ySize = xSize / 92 * 25; // 비율대로
        _getReady.render(canvas,
          position: Vector2(gameRef.size.x * 0.2, gameRef.size.y * 0.2),
          size: Vector2(xSize, ySize),
        );
        break;
      case GameState.play:
        break;
      case GameState.gameover:
        xSize = gameRef.size.x * 0.6;
        ySize = xSize / 96 * 25; // 비율대로
        _gameOver.render(canvas,
          position: Vector2(gameRef.size.x * 0.2, gameRef.size.y * 0.2),
          size: Vector2(xSize, ySize),
        );
        break;
    }
    super.render(canvas);
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }
}