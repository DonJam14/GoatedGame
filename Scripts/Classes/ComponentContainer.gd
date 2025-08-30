class_name ComponentContainer
extends Area2D

signal component_picked(component: GlobalEnums.BiscutIngredient)

@export var component: GlobalEnums.BiscutIngredient = GlobalEnums.BiscutIngredient.NONE

var has_area: bool = false

func _ready() -> void:
	#ensure monitoring for connections
	self.monitoring = true
	
	#set correct collision layers
	self.collision_layer = 8 #layer 4 - interactables
	self.collision_mask = 2 #layer 2 - grabbables
	
	#connect relevant signals
	self.body_entered.connect(self.on_body_entered)
	self.body_exited.connect(self.on_body_exited)

func on_body_entered(area: Node2D) -> void:
	print("body " + str(area) + " entered component area")

func on_body_exited(area: Node2D) -> void:
	print("body " + str(area) + " exited component area")
