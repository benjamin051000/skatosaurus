extends Node2D

# TODO length_squared should do the same thing but without a sqrt
var FLICK_THRESHOLD: float = Vector2(2500, 2500).length()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Using velocity instead of screen_velocity, for better or worse...
		$Status.text = str(event.velocity)
		print(event.velocity)
		if abs(event.velocity.length()) >= FLICK_THRESHOLD:
			$Status.text = "Flick!"
	elif event is InputEventMouseButton:
		print(event)
		var downup_msg = "down" if event.pressed else "up"
		var double_click_msg = "(double)" if event.double_click else ""
		$Status.text = "Mouse {} -> {} {}".format([event.button_index, downup_msg, double_click_msg], "{}")
	elif event is InputEventKey:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()

func _on_button_pressed() -> void:
	print("clicked")
