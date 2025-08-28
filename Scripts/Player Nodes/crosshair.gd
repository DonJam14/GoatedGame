extends Node2D

@onready var crosshair_texture: Sprite2D = $crosshair_texture
@export var rotation_speed: float = 2

var items_held: int = 0

func _ready() -> void:
	#hide OS mouse so crosshair mouse is visible
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta: float) -> void:
	#set position of crosshair to mouse position
	var mouse_pos = get_global_mouse_position()
	self.global_position = mouse_pos
	
	#slowly rotate texture for visuals
	crosshair_texture.rotation += rotation_speed * delta

func on_item_pickup() -> void:
	self.items_held += 1

func on_item_release() -> void:
	self.items_held -= 1
