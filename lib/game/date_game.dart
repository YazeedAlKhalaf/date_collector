import 'dart:async';

import 'package:date_collector/constants.dart';
import 'package:date_collector/game/falling_date.dart';
import 'package:date_collector/game/pause.dart';
import 'package:date_collector/game/player_basket.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class DateGame extends FlameGame with HasDraggableComponents, HasTappables {
  late PlayerBasket playerBasket;
  late FallingDate fallingDate;
  late PauseButton pauseButton;
  late TextComponent scoreText;
  late TextComponent mistakeText;
  int score = 0;
  int mistakes = 0;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    pauseButton = PauseButton(position: Vector2(size.x - 100, 80));
    add(pauseButton);

    playerBasket = PlayerBasket(size);
    add(playerBasket);

    fallingDate = FallingDate(size);
    add(fallingDate);

    scoreText = TextComponent(
      text: 'Score: $score',
      anchor: Anchor.center,
      position: Vector2(size.x / 2, 90),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(scoreText);

    mistakeText = TextComponent(
      text: 'Mistakes: $mistakes',
      anchor: Anchor.center,
      position: Vector2(size.x / 2, 125),
      textRenderer: TextPaint(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(mistakeText);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (playerBasket.toRect().overlaps(fallingDate.toRect())) {
      fallingDate.resetPosition();
      incrementScore();
    }

    if (fallingDate.position.y >= size.y - 50) {
      fallingDate.resetPosition();
      incrementMistakes();
    }
  }

  void incrementScore() {
    score++;
    scoreText.text = 'Score: $score';
  }

  void incrementMistakes() {
    mistakes++;
    mistakeText.text = 'Mistakes: $mistakes';

    if (mistakes >= 3) {
      gameOver();
    }
  }

  void gameOver() {
    pauseEngine();
    overlays.add(finishScreen);
  }

  void resetGame() {
    score = 0;
    mistakes = 0;
    scoreText.text = 'Score: $score';
    mistakeText.text = 'Mistakes: $mistakes';
    fallingDate.resetPosition();

    resumeEngine();
  }
}
