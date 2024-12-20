extends Node2D


@onready var spawnArea = $Area2D/CollisionShape2D.shape.size
@onready var origin = $Area2D/CollisionShape2D.global_position -  spawnArea

var fuel = preload("res://characters/fuel/fuel.tscn")


func gen_random_pos():
	var x = randi_range(-spawnArea.x, spawnArea.x)/2
	var y = randi_range(-spawnArea.y, spawnArea.y)/2
	
	return Vector2(x, y)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_timer_timeout():
	if GlobalVariables.fuelBarrels < GlobalVariables.maxFuelBarrels:
		var fuelSpawn = fuel.instantiate()
		fuelSpawn.position = gen_random_pos()
		add_child(fuelSpawn)
		GlobalVariables.fuelBarrels += 1
		if OS.is_debug_build():
			print("Current fuel barrels: " +  str(GlobalVariables.fuelBarrels))
