extends Node2D

@export var timer: Timer
@export var enemy: PackedScene


func _on_timer_timeout() -> void:
	timer.start()
	var enemyInstance = enemy.instantiate()
	get_parent().add_child(enemyInstance)
	pass
