import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';

class FallingDate extends SpriteComponent {
  final Vector2 screenSize;

  FallingDate(this.screenSize) : super(size: Vector2(80, 80)) {
    anchor = Anchor.topCenter;
    position = Vector2(randomX(), 0);
  }

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('date.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += 200 * dt;

    if (position.y > screenSize.y) {
      resetPosition();
    }
  }

  double randomX() {
    return Random().nextDouble() * (screenSize.x - 80);
  }

  void resetPosition() {
    position.setValues(randomX(), -80);
  }
}
