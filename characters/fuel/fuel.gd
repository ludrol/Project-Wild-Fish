extends Node2D

signal fuel_pickup
@export var fuelValue = 100
var area
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node_or_null("../Player") #this is really hacky solution. it will break. 
	area = get_node("Area2D")
	if player == null:
		print("you dumbass check " + str(self))
	player.fuel_interaction.connect(_on_player_fuel_interaction,4)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

func _on_player_fuel_interaction():
	for body in area.get_overlapping_areas():
		if body.is_in_group("players group"):  
			GlobalVariables.playerFuel += fuelValue
			print("current fuel: " + str(GlobalVariables.playerFuel))
			#for child in self.get_children():
				#child.queue_free()
			queue_free()
				
				
