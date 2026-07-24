extends CharacterBody2D

var jumping := false

# Jump velocity function. Holds a velocity curve that you sample.
@export var jump_velocity: Curve
# Time t into the jump. Used as input to the jump_curve
var jump_t : float

func _physics_process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("click")
		jumping = true
		jump_t = 0
	
	if jumping:
		print('jumping')
		jump_t += delta
		if jump_t > jump_velocity.max_domain:
			jumping = false
		else:
			velocity.y = -jump_velocity.sample(jump_t) * 10
	
	move_and_slide()
