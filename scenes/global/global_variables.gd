extends Node

@export_category("starting values")
@export var playerFuel = 100
@export var playerFreeze = 1000
@export var monsterFreeze = 100
@export var generatorFuel = 300
var fuelBarrels = 0

@export_category("max values")
@export var maxPlayerFuel = 500
@export var maxPlayerFreeze = 1000
@export var maxMonsterFreeze = 1000
@export var maxGeneratorFuel = 1000
@export var maxFuelBarrels = 20





# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
