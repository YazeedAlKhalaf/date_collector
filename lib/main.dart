import 'package:date_collector/constants.dart';
import 'package:date_collector/game/background_widget.dart';
import 'package:date_collector/game/date_game.dart';
import 'package:date_collector/game/finish_screen.dart';
import 'package:date_collector/game/pause.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(GameWidget(
    game: DateGame(),
    overlayBuilderMap: {
      pauseMenu: (BuildContext context, DateGame game) {
        return PauseOverlay(game: game);
      },
      finishScreen: (BuildContext context, DateGame game) {
        return FinishScreen(game: game);
      },
    },
    backgroundBuilder: (BuildContext context) {
      return const BackgroundWidget();
    },
    loadingBuilder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    },
  ));
}
