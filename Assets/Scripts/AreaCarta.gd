extends Area2D

signal clicada

func _on_AreaCarta_input_event(_viewport: Object, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton:
		if event.is_pressed() && (event.button_index == BUTTON_LEFT):
			self.emit_signal("clicada")
	elif event is InputEventScreenTouch:
		if event.is_action_type():
			self.emit_signal("clicada")
		
	pass
