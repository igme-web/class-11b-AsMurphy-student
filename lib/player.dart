import 'dart:async';
import 'package:flame/components.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameReference<FlameDemoGame> {
  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache("player.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // We'll use this later for movement logic
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
