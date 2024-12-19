extends Node2D


@onready var spawnArea = $Area2D/CollisionShape2D.shape.extents
@onready var origin = $Area2D/CollisionShape2D.global_position -  spawnArea

var fuel = preload("res://characters/fuel/fuel.tscn")


func gen_random_pos():
	var x = randi_range(origin.x, spawnArea.x)
	var y = randi_range(origin.y, spawnArea.y)
	
	return Vector2(x, y)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_timer_timeout():
	var fuelSpawn = fuel.instantiate()
	fuelSpawn.position = gen_random_pos()
	add_child(fuelSpawn)
