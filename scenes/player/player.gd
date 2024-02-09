extends CharacterBody2D

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary action"):
		print("laser fired")
	
	if Input.is_action_pressed("secondary action"):
		print("grenade thrown")
	
func test_function():
	print("This is a test function")
