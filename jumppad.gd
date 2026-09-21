extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y += -800
	elif body is RigidBody2D:
		body.apply_central_impulse(Vector2(0,-800))
	pass # Replace with function body.
