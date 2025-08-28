class_name PhysicsDraggableNode
extends RigidBody2D

## Same as a draggable node- but with physics

@onready var crosshair := get_tree().get_first_node_in_group("Crosshair")
const SPRING_CONSTANT := 250
var has_mouse: bool = false
var held: bool = false
signal object_held
signal object_released

func _ready() -> void:
	#set relevant properties
	#self.can_sleep = false #fixes bug where holding it still makes it float there
	self.lock_rotation = true
	self.collision_layer = 2 #exists on layer 2
	self.collision_mask = 1 | 4 #set to scan for layers 1 and 3
	self.input_pickable = true
	
	#make signal connections
	self.mouse_entered.connect(self._on_mouse_entered)
	self.mouse_exited.connect(self._on_mouse_exited)
	
	#connect own signals to crosshair
	self.object_held.connect(crosshair.on_item_pickup)
	self.object_released.connect(crosshair.on_item_release)

func apply_impulse_to_mouse(modifier: float) -> void:
	self.apply_central_impulse(SPRING_CONSTANT * modifier * get_local_mouse_position() - self.linear_velocity / 4)

func _physics_process(delta: float) -> void:
	#object is held
	if held:
		if Input.is_action_pressed("left_click"):
			apply_impulse_to_mouse(delta)
		elif Input.is_action_just_released("left_click"):
			held = false
			object_released.emit()
	
	#object is just picked up - requires no items currently held
	elif Input.is_action_just_pressed("left_click") and has_mouse and crosshair.items_held == 0:
		held = true
		object_held.emit()
		#apply one impulse
		apply_impulse_to_mouse(delta)

func _on_mouse_entered() -> void:
	self.has_mouse = true

func _on_mouse_exited() -> void:
	self.has_mouse = false
