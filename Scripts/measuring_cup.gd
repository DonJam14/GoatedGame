class_name MeasuringCup
extends PhysicsDraggableNode

## Preload textures
@onready var none_texture := preload("res://Assets/Objects/cup.png")
@onready var flour_texture := preload("res://Assets/Objects/log_cup_flour.png")
@onready var sugar_texture := preload("res://Assets/Objects/log_cup_sugar.png")
@onready var milk_texture := preload("res://Assets/Objects/log_cup_milk.png")

## Get child Sprite2D
@onready var sprite := $MCupTexture

var stored: GlobalEnums.BiscutIngredient = GlobalEnums.BiscutIngredient.NONE

func on_component_picked(component: GlobalEnums.BiscutIngredient) -> void:
	match component:
		GlobalEnums.BiscutIngredient.FLOUR:
			sprite.texture = flour_texture
		GlobalEnums.BiscutIngredient.SUGAR:
			sprite.texture = sugar_texture
		GlobalEnums.BiscutIngredient.MILK:
			sprite.texture = milk_texture
		_:
			sprite.texture = none_texture
