class_name ComponentContainer
extends Area2D

signal component_picked(component: GlobalEnums.BiscutIngredient)

@export var component: GlobalEnums.BiscutIngredient = GlobalEnums.BiscutIngredient.NONE

@onready var measuring_cup := get_tree().get_first_node_in_group("MeasuringCup")

var bodies_held: Array = []

func _ready() -> void:
	#ensure monitoring for connections
	self.monitoring = true
	
	#set correct collision layers
	self.collision_layer = 8 #layer 4 - interactables
	self.collision_mask = 2 #layer 2 - grabbables
	
	#connect relevant signals
	self.body_entered.connect(self.on_body_entered)
	self.body_exited.connect(self.on_body_exited)
	self.component_picked.connect(measuring_cup.on_component_picked)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right_click"):
		if not bodies_held.is_empty():
			for body in bodies_held:
				if body.is_in_group("MeasuringCup"):
					component_picked.emit(component)

func on_body_entered(body: Node2D) -> void:
	bodies_held.append(body)

func on_body_exited(body: Node2D) -> void:
	bodies_held.erase(body)
