import 'package:date_collector/constants.dart';
import 'package:date_collector/game/date_game.dart';
import 'package:flutter/material.dart';

class FinishScreen extends StatelessWidget {
  final DateGame game;

  const FinishScreen({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.8),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Game Over',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Your Score: ${game.score}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              game.overlays.remove(finishScreen);
              game.resetGame();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
