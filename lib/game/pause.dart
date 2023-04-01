import 'dart:async';

import 'package:date_collector/constants.dart';
import 'package:date_collector/game/date_game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class PauseButton extends SpriteComponent with Tappable, HasGameRef<DateGame> {
  PauseButton({
    required Vector2 position,
  }) : super(position: position, size: Vector2(50, 50));

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('pause.png');
  }

  @override
  bool onTapDown(TapDownInfo info) {
    if (!gameRef.overlays.isActive(pauseMenu)) {
      gameRef.pauseEngine();
      gameRef.overlays.add(pauseMenu);
    }

    return super.onTapDown(info);
  }
}

class PauseOverlay extends StatelessWidget {
  final DateGame game;

  const PauseOverlay({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'PAUSED',
            style: TextStyle(
              fontSize: 48,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              game.resumeEngine();
              game.overlays.remove(pauseMenu);
            },
            child: const Text(
              'Resume',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
