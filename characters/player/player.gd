extends Node2D
@export var speed = 400
var area
var fuel


# Called when the node enters the scene tree for the first time.
func _ready():
	area = get_node("Area2D")
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.stop()
		
		position += velocity * delta
		
#	check if generator is in range to be interacted with
	if Input.is_action_just_pressed("interact"):
		for body in area.get_overlapping_areas():
			print(body)
			if body.is_in_group("generators group"):  
				print("generator interaction!")
				emit_signal("generator_interaction")
			if body.is_in_group("fuels goup"):
				print("fuel interaction")
#func 		
		
