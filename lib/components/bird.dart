import 'package:flame/components.dart';

final double BIRD_W = 52;
final double BIDR_H = 36.7;
class Bird extends SpriteAnimationComponent {
  Bird() : super.sequenced(BIRD_W, BIDR_H, "bird.png", 3, textureWidth: 17, textureHeight: 12);
}