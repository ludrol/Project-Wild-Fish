extends CanvasLayer

@onready var fuelBar = %FuelBar
@onready var Temper = %Temperature

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	fuelBar.value = float(GlobalVariables.playerFuel) / GlobalVariables.maxPlayerFuel * 100
	Temper.value = float(GlobalVariables.playerFreeze) / GlobalVariables.maxPlayerFreeze * 100
	#print(float(GlobalVariables.playerFuel) / GlobalVariables.maxPlayerFuel)
	
	
