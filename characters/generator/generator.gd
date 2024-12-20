extends Node2D

@export var fuelInput = 150
@export var fuelConsumption = 30.0

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
	if GlobalVariables.generatorFuel > 0:
		GlobalVariables.generatorFuel -= fuelConsumption * delta
		GeneratorBar.value = float(GlobalVariables.generatorFuel) / GlobalVariables.maxGeneratorFuel * 100
	else: 
		GlobalVariables.generatorFuel = 0
	
	

func _on_player_generator_interaction():
	for body in area.get_overlapping_areas():
		if body.is_in_group("players group"):  
			
			#check if player has fuel
			if GlobalVariables.playerFuel > 0: 
				
				#check if player has enough fuel
				var input = fuelInput
				if GlobalVariables.playerFuel - input < 0: 
					input = GlobalVariables.playerFuel
					#GlobalVariables.playerFuel = 0
					
				#check if generator has room for fuel
				if GlobalVariables.generatorFuel + input < GlobalVariables.maxGeneratorFuel: 
					GlobalVariables.generatorFuel += input
				else:
					input = GlobalVariables.maxGeneratorFuel - GlobalVariables.generatorFuel
					GlobalVariables.generatorFuel = GlobalVariables.maxGeneratorFuel
					
					
				#take fuel from player
				GlobalVariables.playerFuel -= input
				if OS.is_debug_build():
					print("current player fuel: " + str(GlobalVariables.playerFuel))
			
			#no fuel was added
			else:
				GlobalVariables.playerFuel = 0
				if OS.is_debug_build():
					print("no more fuel to add")
				
			#for child in self.get_children():
				#child.queue_free()
	
	
	
	
	
