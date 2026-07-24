extends Node2D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if event.velocity != event.screen_velocity:
			print("v", event.velocity, "scr v", event.screen_velocity)
		$Status.text = str(event.velocity)
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
