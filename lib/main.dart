import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'player.dart';  // Add this import at the top
import 'package:flame/events.dart';

void main() {
  runApp(
    GameWidget(
      game: FlameDemoGame(),
    )
  );
}

class FlameDemoGame extends FlameGame {  // No mixin needed for joystick
  late Player player;
  late JoystickComponent joystick;
  
  // Visual styles for the joystick
  final knobPaint = BasicPalette.red.withAlpha(200).paint();
  final knobBgPaint = BasicPalette.red.withAlpha(100).paint();
  
  @override
  Future<void> onLoad() async {
    await images.loadAll(["player.png"]);
    
    // Create the joystick
    joystick = JoystickComponent(
      knob: CircleComponent(
        radius: 15,
        paint: knobPaint,
      ),
      background: CircleComponent(
        radius: 50,
        paint: knobBgPaint,
      ),
      margin: const EdgeInsets.only(left: 20, bottom: 20),
    );
    
    player = Player(joystick: joystick);  // Pass joystick to player
    add(player);
    add(joystick);  // Don't forget to add joystick to the game!
  }
}