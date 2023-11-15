import 'package:bird_game/components/pipe_set.dart';
import 'package:bird_game/components/titles.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'components/bird.dart';
import 'components/floor.dart';
import 'components/score.dart';
import 'game_state.dart';
import 'main.dart';

class BirdGame extends FlameGame with HasGameRef, TapDetector {
  late final AudioPlayer audioplayer = AudioPlayer();
  late final _bird;
  late final _floor;
  late final _titles;
  late final _pipeSet;
  late final _score;

  BirdGame();

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final gameSize = gameRef.size; //화면크기
    Sprite spriteBg = await loadSprite('bg.png');
    spriteSheet = await loadSprite('sprites.png');
    add(SpriteComponent(sprite: spriteBg, autoResize: false, position: Vector2(0,0), size: gameSize));

    final birdSize = Vector2(BIRD_W, BIRD_H);
    final birdPos  = Vector2(gameSize.x/2.0, 0);
    _bird = Bird(birdPos, birdSize);
    add(_bird);

    _pipeSet = PipeSet();
    add(_pipeSet);

    double xSize = gameSize.x * 2;
    //double ySize = xSize / 168 * 56; // 비율대로
    final floorPos  = Vector2(0, 0);//gameSize.y - ySize*0.25);
    final floorSize = Vector2(0, 0); // --> 안보이게 함 (변칙)
    _floor = Floor(floorPos, floorSize);
    add(_floor);

    _titles = Titles();
    add(_titles);

    _score = Score();
    add(_score);
  }

  @override
  void update(double dt) {
    if (gameState == GameState.play) {
      if (checkIf2CompoCollision(_bird.toRect(), _floor.toRect())) {
        gameState = GameState.gameover;
      }
      if (checkIf2CompoCollision(_bird.toRect(), _pipeSet.getPipeUpRect())) {
        gameState = GameState.gameover;
      }
      if (checkIf2CompoCollision(_bird.toRect(), _pipeSet.getPipeDownRect())) {
        gameState = GameState.gameover;
      }
      checkIfBirdPassedPipe();
    }
    super.update(dt);
  }

  @override
  void onTap() {
    _bird.onTap();
    switch (gameState) {
      case GameState.pause:
        gameState = GameState.play;
        break;
      case GameState.play:
        break;
      case GameState.gameover:
        gameState = GameState.pause;
        _score.resetScore();
        break;
    }
  }

  bool checkIf2CompoCollision(Rect item1, Rect item2) {
    var intersectRect = item1.intersect(item2);
    return intersectRect.width > 2 && intersectRect.height > 2;
  }

  void checkIfBirdPassedPipe() {
    if (_pipeSet.hasScored) return;

    if (_pipeSet.getPipeUpRect().right < _bird.toRect().left) {
      _score.addScore();
      _pipeSet.scoreUpdated();
    }
  }
}
