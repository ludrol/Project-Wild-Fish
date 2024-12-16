extends CanvasLayer

@onready var fuelBar = %FuelBar


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if fuelBar.value > 99:
		fuelBar.value = 0
	else:
		fuelBar.value += 1
	
	
	
