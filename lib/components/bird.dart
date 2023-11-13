import 'package:flame/components.dart';

final double BIRD_W = 52;
final double BIDR_H = 36.7;
final double GRAVITY = 900;
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
    // TODO: implement update
    super.update(dt);
    speedY += GRAVITY * dt;
    this.anchor = Anchor.center;
    this.y += (speedY * dt) / 2;
  }

  void onTap() {
    this.speedY = -500;
    //FlameAudio.bgm.play('bubble_pop.mp3');
    //AudioPlayer('bubble_pop.mp3');
  }
}