extends PhysicsDraggableNode

## Preload textures
@onready var none_texture := preload("res://Assets/Objects/cup.png")
@onready var flour_texture := preload("res://Assets/Objects/log_cup_flour.png")
@onready var sugar_texture := preload("res://Assets/Objects/log_cup_sugar.png")
@onready var milk_texture := preload("res://Assets/Objects/log_cup_milk.png")

## Get child Sprite2D
@onready var sprite := $MCupTexture

var stored: GlobalEnums.BiscutIngredient = GlobalEnums.BiscutIngredient.NONE
