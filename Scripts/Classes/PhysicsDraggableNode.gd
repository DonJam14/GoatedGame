class_name PhysicsDraggableNode
extends RigidBody2D

## Same as a draggable node- but with physics
const SPRING_CONSTANT := 200
var has_mouse: bool = false
var held: bool = false
var awaiting_release = false
#func apply_impulse_to_mouse() -> void:
	#self.apply_central_impulse(SPRING_CONSTANT * get_local_mouse_position() - self.linear_velocity / 4)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left_click") and (self.has_mouse or self.awaiting_release):
		held = true
		self.apply_central_impulse(SPRING_CONSTANT * get_local_mouse_position() * delta - self.linear_velocity / 4)
	elif Input.is_action_just_released("left_click"):
		self.awaiting_release = false
		#for some reason if the object is perfectly still it just floats there? i'm chill w it but yeah

func _on_mouse_entered() -> void:
	self.has_mouse = true

func _on_mouse_exited() -> void:
	self.has_mouse = false
	if Input.is_action_pressed("left_click"):
		self.awaiting_release = true
