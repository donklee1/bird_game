import 'dart:ui';
import 'dart:collection';
import 'package:bird_game/consts/sprite_dimentions.dart';
import 'package:flame/components.dart';

class Score extends PositionComponent with HasGameRef {

  static double numW = 0;
  static double numH = 0;
  late final Sprite _zero;
  late final Sprite _one;
  late final Sprite _two;
  late final Sprite _three;
  late final Sprite _four;
  late final Sprite _five;
  late final Sprite _six;
  late final Sprite _seven;
  late final Sprite _eight;
  late final Sprite _nine;

  late HashMap<String, Sprite> _digits;
  late SpriteComponent _oneDigit;
  late SpriteComponent _twoDigit;
  late SpriteComponent _threeDigit;

  @override
  Future<void>? onLoad() async {
    numW = gameRef.size.x / 20.0;
    numH = numW / 12.0 * 18.0;
    _zero = await gameRef.loadSprite('sprites.png',
        srcPosition: Vector2(SpritePositions.zeroNumberX, SpritePositions.zeroNumberY),
        srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
        );
    _one = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.oneNumberX, SpritePositions.oneNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
      );
    _two = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.twoNumberX, SpritePositions.twoNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _three = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.threeNumberX, SpritePositions.threeNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _four = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.fourNumberX, SpritePositions.fourNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _five = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.fiveNumberX, SpritePositions.fiveNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _six = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.sixNumberX, SpritePositions.sixNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _seven = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.sevenNumberX, SpritePositions.sevenNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _eight = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.eightNumberX, SpritePositions.eightNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _nine = await gameRef.loadSprite('sprites.png',
      srcPosition: Vector2(SpritePositions.nineNumberX, SpritePositions.nineNumberY),
      srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
    );
    _digits = HashMap.from(
        { "0": _zero,
          "1": _one,
          "2": _two,
          "3": _three,
          "4": _four,
          "5": _five,
          "6": _six,
          "7": _seven,
          "8": _eight,
          "9": _nine,
        }
    );
    _oneDigit = SpriteComponent(sprite: _digits["0"], autoResize: false, anchor: Anchor.center,
        position: Vector2(numW * 8,numH* 100), size: Vector2(numW, numH));
    _twoDigit = SpriteComponent(sprite: _digits["0"], autoResize: false, anchor: Anchor.center,
        position: Vector2(numW * 100,numH* 100), size: Vector2(numW, numH));
    _threeDigit = SpriteComponent(sprite: _digits["0"], autoResize: false, anchor: Anchor.center,
        position: Vector2(numW * 20,numH* 100), size: Vector2(numW, numH));

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    _oneDigit.render(canvas);
    _twoDigit.render(canvas);
    _threeDigit.render(canvas);

    super.render(canvas);
  }
}