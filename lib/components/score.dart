import 'dart:ui';
import 'dart:collection';
import 'package:bird_game/consts/sprite_dimentions.dart';
import 'package:flame/components.dart';

class Score extends Component with HasGameRef {

  static double numW = 0;
  static double numH = 0;
  late HashMap<String, Sprite> _digits;
  final _num = List<Sprite?>.filled(10, null, growable: false);
  late Sprite _oneDigit;
  late Sprite _twoDigit;
  late Sprite _threeDigit;
  int _score = 0;

  @override
  Future<void>? onLoad() async {
    numW = gameRef.size.x / 20.0;
    numH = numW / 12.0 * 18.0;
    for (int i = 0; i<10; i++) {
      _num[i] = await gameRef.loadSprite('sprites.png',
        srcPosition: SpritePositions.listNumber[i],
        srcSize: Vector2(SpriteDimentions.numberWidth, SpriteDimentions.numberHeight),
        );
    }

    _digits = HashMap.from(
        { "0": _num[0],
          "1": _num[1],
          "2": _num[2],
          "3": _num[3],
          "4": _num[4],
          "5": _num[5],
          "6": _num[6],
          "7": _num[7],
          "8": _num[8],
          "9": _num[9],
        }
    );
    resetScore();

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    String scoreInStr = _score.toString().padLeft(3, "0");
    _oneDigit = _digits[scoreInStr[0]]!;
    _twoDigit = _digits[scoreInStr[1]]!;
    _threeDigit = _digits[scoreInStr[2]]!;

    _oneDigit.render(canvas, position: Vector2(numW * 8,numH), size: Vector2(numW, numH));
    _twoDigit.render(canvas, position: Vector2(numW * 10,numH), size: Vector2(numW, numH));
    _threeDigit.render(canvas, position: Vector2(numW * 12,numH), size: Vector2(numW, numH));

    super.render(canvas);
  }

  void addScore() {
    _score++;
  }

  void resetScore() {
    _score = 0;
  }
}