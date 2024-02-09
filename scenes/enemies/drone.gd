extends CharacterBody2D

func _process(_delta):
	#direction
	var direction = Vector2.LEFT
	
	#velocity
	velocity =  direction  * 400
	
	#Move and slide
	move_and_slide()
