import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

class PlayerBasket extends SpriteComponent with DragCallbacks {
  final Vector2 screenSize;

  PlayerBasket(this.screenSize) : super(size: Vector2(100, 100)) {
    anchor = Anchor.bottomCenter;
    position = Vector2(screenSize.x / 2, screenSize.y - size.y / 2);
  }

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('basket.png');
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.x += event.delta.x;
    position.x = position.x.clamp(
      100 / 2,
      screenSize.x - 100 / 2,
    );
  }
}
