extends Node2D

func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	#rotate 90 degrees so wand is angled correctly
	self.rotate(PI / 2)
