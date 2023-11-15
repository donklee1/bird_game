import 'dart:ui';
import 'dart:math';
import 'package:bird_game/consts/const.dart';
import 'package:flame/components.dart';

class PipeSet extends Component with HasGameRef {
  late final Sprite _pipeUp;
  late final Sprite _pipeDown;
  double pipePos = 0;
  double pipeH = 0;
  double pipeW = 0;
  double xSize = 0;
  double ySize = 0;
  int pipeLevel = 1;
  double pipeGap = 4;
  bool hasScored = false;

  @override
  Future<void>? onLoad() async {
    _pipeUp = await gameRef.loadSprite('pipe_up.png');
    _pipeDown = await gameRef.loadSprite('pipe_down.png');
    pipeH = gameRef.size.y / 12 * 7;
    pipeW = pipeH / 160 * 26;
    pipePos = gameRef.size.x;
    return super.onLoad();
  }
  @override
  void render(Canvas canvas) {
    _pipeUp.render(canvas,
      position: Vector2(pipePos, pipeH/ 7 * (pipeLevel-7)),
      size: Vector2(pipeW, pipeH));
    _pipeDown.render(canvas,
        position: Vector2(pipePos, pipeH/ 7 * (pipeLevel + pipeGap)),
        size: Vector2(pipeW, pipeH));
    super.render(canvas);
  }

  @override
  void update(double dt) {
    switch (gameState) {
      case GameState.pause:
        pipePos = gameRef.size.x;
        hasScored = false;
        break;
      case GameState.play:
        if (pipePos < -pipeW) {
          pipePos = gameRef.size.x;
          hasScored = false;
          pipeLevel = Random().nextInt(3) + 1; //1,2,3
        }
        pipePos -= dt * 30 + GAME_SPEED;
        break;
      case GameState.gameover:
        break;
    }
    super.update(dt);
  }

  Rect getPipeUpRect() {
    return Rect.fromLTWH(pipePos, pipeH / 7 * (pipeLevel - 7), pipeW, pipeH);
  }
  Rect getPipeDownRect() {
    return Rect.fromLTWH(pipePos, pipeH / 7 * (pipeLevel + pipeGap), pipeW, pipeH);
  }

  void scoreUpdated() {
    hasScored = true;
  }
}