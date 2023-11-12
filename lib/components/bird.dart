import 'package:flame/components.dart';

final double BIRD_W = 52;
final double BIDR_H = 36.7;
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

  //: super.sequenced(BIRD_W, BIDR_H, "bird.png", 3, textureWidth: 17, textureHeight: 12);
}