extends Node2D

@export var fuelInput = 20
@export var fuelConsumption = 20.0

@onready var GeneratorBar = %GeneratorBar
var area
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node_or_null("../Player") #this is really hacky solution. it will break. 
	area = get_node("Area2D")
	if player == null:
		print("you dumbass check " + str(self))
	player.generator_interaction.connect(_on_player_generator_interaction)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	GlobalVariables.generatorFuel -= fuelConsumption * delta
	GeneratorBar.value = float(GlobalVariables.generatorFuel) / GlobalVariables.maxGeneratorFuel * 100
	
	
	

func _on_player_generator_interaction():
	for body in area.get_overlapping_areas():
		if body.is_in_group("players group"):  
			if GlobalVariables.playerFuel > 0:
				GlobalVariables.playerFuel -= fuelInput
				GlobalVariables.generatorFuel += fuelInput
				if OS.is_debug_build():
					print("current player fuel: " + str(GlobalVariables.playerFuel))
			else:
				if OS.is_debug_build():
					print("no more fuel to add")
			#for child in self.get_children():
				#child.queue_free()
	
	
	
	
	
