extends Node2D

signal fuel_pickup
@export var fuelValue = 100
var area
var player


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("../../Player") #this is really hacky solution. it will break. 
	#print(player)
	area = get_node("Area2D")
	#if player == null:
		#print("you dumbass check " + str(self))
	player.fuel_interaction.connect(_on_player_fuel_interaction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

func _on_player_fuel_interaction():
	if not is_queued_for_deletion():
		for body in area.get_overlapping_areas():
			if body.is_in_group("players group"):  
				if GlobalVariables.playerFuel + fuelValue < GlobalVariables.maxPlayerFuel:
					GlobalVariables.playerFuel += fuelValue
				else:
					GlobalVariables.playerFuel = GlobalVariables.maxPlayerFuel
				print("current fuel: " + str(GlobalVariables.playerFuel))
				#for child in self.get_children():
					#child.queue_free()
				GlobalVariables.fuelBarrels -= 1
				queue_free()
					
				
