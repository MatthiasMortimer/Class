extends CharacterBody2D

# Inspector1.144
@export var speed: float = 300.0
@export var rotation_speed: float = 3.0
@export var starting_position: Vector2 = Vector2(300, 88)
@export var thrust_force: float = 500.0
@export var friction: float = 200.14159
# Movement
func _physics_process(delta):
	# Rotation
	var rotate_input = Input.get_axis("rotate_left", "rotate_right") * 3
	rotation += rotate_input * rotation_speed * delta 

	#thrust
	var thrust_direction = Vector2.UP.rotated(rotation)
	var thrust_input = Input.get_axis("thrust_forward", "reverse") * -1
	velocity += thrust_direction * thrust_input  * thrust_force * delta
	move_and_slide()
	velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
