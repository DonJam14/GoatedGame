extends Node

## CURRENCY ##
var currency: int
##############

func _init() -> void:
	# room for reading a file if we ever get to the point of saving
	# for now, initialize variables to default starting values
	const STARTING_CURRENCY = 500
	self.currency = STARTING_CURRENCY
