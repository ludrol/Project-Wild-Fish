extends CharacterBody2D
const speed = 350.0
const friction = 7
var area
var fuel
signal generator_interaction
signal fuel_interaction

# Called when the node enters the scene tree for the first time.
func _ready():
	area = get_node("Area2D")
	
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	check if generator is in range to be interacted with
	if Input.is_action_just_pressed("interact"):
		for body in area.get_overlapping_areas():
			#print(body)
			if body.is_in_group("generators group"):  
				if OS.is_debug_build():
					print("generator interaction!")
				emit_signal("generator_interaction")
			if body.is_in_group("fuels group"):
				if OS.is_debug_build():
					print("fuel interaction")
				emit_signal("fuel_interaction")
#func 		
		
		
func _physics_process(delta):
 
	
	#var velocity = Vector2.ZERO # The player's movement vector.
	if velocity.length()/speed > 0.2:
		velocity = velocity - speed * friction * delta * velocity.normalized()
	else:
		velocity = Vector2.ZERO
		
	var force = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		force.x += 1
	if Input.is_action_pressed("move_left"):
		force.x -= 1
	if Input.is_action_pressed("move_down"):
		force.y += 1
	if Input.is_action_pressed("move_up"):
		force.y -= 1
	if force.length() > 0:
		velocity = force.normalized() * speed
		#$AnimatedSprite2D.play()
	#else:
		#$AnimatedSprite2D.stop()
		
		#position += velocity * delta
		
	move_and_slide()
