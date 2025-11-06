import 'dart:async';
import 'package:flame/components.dart';
import 'main.dart';

class Player extends SpriteComponent with HasGameReference<FlameDemoGame> {
  late Vector2 moveTarget = Vector2.zero();

  @override
  Future<void> onLoad() async {
    sprite = Sprite(game.images.fromCache("player.png"));
    anchor = Anchor.center;
    height = 100;
    width = 100;
    position = Vector2(game.size.x / 2, game.size.y - 100);
    moveTarget = position.clone(); // Start with target = current position
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Only move if we're not at the target yet
    if (position.distanceTo(moveTarget) > 1) {
      Vector2 direction = (moveTarget - position).normalized();
      position.add(direction * 100 * dt); // 100 = speed in pixels/second
    }
  }

  void moveTo(Vector2 targetPosition) {
    moveTarget = targetPosition;
  }
}
