class_name DraggableNode
extends Node2D

## DraggableNode will contain all the necessary functionality for draggable nodes (lol)
## Future nodes that should be draggable and have their own special code should extend DraggableNode
var held := false
var offset := Vector2(0, 0) #to make sure alignment with mouse upon pickup is correct

func _process(delta: float) -> void:
	if held:
		follow_mouse()

func follow_mouse() -> void:
	self.position = get_global_mouse_position() + offset

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if lmb is being held over collision shape, offset is updated and held is set to true
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			self.offset = position - get_global_mouse_position()
			self.held = true
		else:
			self.held = false
