class_name PhysicsDraggableNode
extends RigidBody2D

## Same as a draggable node- but with physics
## Requires: 
## can_sleep = false
## lock_rotation = true (though this could be changed later if apply impulse function factors in rotation)
## collision_layer = 2
## input_pickable = true
const SPRING_CONSTANT := 250
var has_mouse: bool = false
#var held: bool = false
var awaiting_release = false

func apply_impulse_to_mouse(modifier: float) -> void:
	self.apply_central_impulse(SPRING_CONSTANT * modifier * get_local_mouse_position() - self.linear_velocity / 4)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left_click") and (self.has_mouse or self.awaiting_release):
		#held = true
		apply_impulse_to_mouse(delta)
	elif Input.is_action_just_released("left_click"):
		self.awaiting_release = false
		#held = false

func _on_mouse_entered() -> void:
	self.has_mouse = true

func _on_mouse_exited() -> void:
	self.has_mouse = false
	if Input.is_action_pressed("left_click"):
		self.awaiting_release = true
