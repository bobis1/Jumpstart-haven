extends RigidBody2D

@export var force = 1500.0
@export var target: Marker2D
@export var burst_knockback_force: float = 2500.0

@export var health: float

var knockbackDir

var targetPose: Vector2
var isGrounded: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target = get_tree().get_first_node_in_group("PlayerMarker")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not target:
		return
	targetPose = target.global_position

	var direction = (targetPose - global_position).normalized()
	var distance = global_position.distance_to(targetPose)

	#constant_force = direction * force * distance
	apply_central_force(direction * force)

	pass
