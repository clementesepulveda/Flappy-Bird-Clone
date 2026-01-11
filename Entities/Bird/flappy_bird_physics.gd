extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
@export var ROTATION_SPEED = 0.25

@export var angle = 0;


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction := Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

	#angle = velocity.y
	
	var transformed_angle = clamp(
		velocity.y * ROTATION_SPEED,
		-90,
		90
	)

	move_and_slide()
	$Sprite2D.rotation_degrees = transformed_angle
	
	print(transformed_angle)
	print(velocity)

#func _input(event):
	#if event is InputEventMouseButton:
		#velocity = JUMP_VELOCITY
