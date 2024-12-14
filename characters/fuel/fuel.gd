extends Node2D

signal fuel_pickup
@export var fuelValue = 100
var area



# Called when the node enters the scene tree for the first time.
func _ready():
	area = get_node("Area2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	for body in area.get_overlapping_areas():
			print(body)
			if body.is_in_group("players group"):  
				print("players interaction!")
				emit_signal("fuel_pickup")
