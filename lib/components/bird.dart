import 'package:bird_game/game_state.dart';
import 'package:bird_game/my_game.dart';
import 'package:bird_game/options.dart';
import 'package:flame/components.dart';

const double BIRD_W = 52;
const double BIRD_H = 36.7;
const double GRAVITY = 900;
class Bird extends SpriteAnimationComponent with HasGameRef {
  Bird(
      Vector2 position,
      Vector2 size,
      ) : super(
    position: position,
    size: size,
    anchor: Anchor.center,
  );

  @override
  Future<void>? onLoad() async {
    animation = await gameRef.loadSpriteAnimation(
      'bird.png',
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.5,
        textureSize: Vector2(17, 12),
      ),
    );
    return super.onLoad();
  }

  double speedY = 0.0;
  @override
  void update(double dt) {
    super.update(dt);
    anchor = Anchor.center;

    switch (gameState) {
      case GameState.pause:
        this.y = gameRef.size.y * 0.4;
        this.x = gameRef.size.x / 2;
        break;
      case GameState.play:
        speedY += (GRAVITY + GAME_SPEED) * dt;
        this.y += (speedY * dt) / 2;
        break;
      case GameState.gameover:
        break;
    }
  }

  void onTap() {
    speedY = -500;
    switch (gameState) {
      case GameState.pause:
        speedY = -500;
      //await audioplayer.play(UrlSource('bubble_pop.mp3'));
        break;
      case GameState.play:
        speedY = -500;
        //await audioplayer.play(UrlSource('bubble_pop.mp3'));
        break;
      case GameState.gameover:
        break;
    }
  }
}