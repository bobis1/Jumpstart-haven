extends CharacterBody2D


@export var SPEED = 600.0
@export var JUMP_VELOCITY = -900.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ui_left"):
		$Sprite2D.scale.x = -1.643
	if Input.is_action_just_pressed("ui_right"):
		$Sprite2D.scale.x = 1.643

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		get_tree().change_scene_to_file("res://main.tscn")
	pass


func _on_death_block_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
