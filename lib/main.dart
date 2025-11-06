import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'player.dart';  // Add this import at the top

void main() {
  runApp(
    GameWidget(
      game: FlameDemoGame(),
    )
  );
}

class FlameDemoGame extends FlameGame {
  late Player player;  // Declare the player variable
  
  @override
  Future<void> onLoad() async {
    await images.loadAll(["player.png"]);
    
    player = Player();  // Create the player
    add(player);        // Add it to the game (makes it visible!)
  }
}