extends CharacterBody2D

signal laser_fired(pos, direction)
signal grenade_thrown(pos,direction)

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	#rotate player
	look_at(get_global_mouse_position())
	
	#laser shooting input
	var player_direction  = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") and can_laser:
		#Randomly select marker 2D for laser
		var laser_markers = $LaserStartPosition.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$laser_cd.start()
		laser_fired.emit(selected_laser.global_position,player_direction)
		
		
		
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos = $LaserStartPosition.get_children()[1].global_position
		can_grenade = false
		$grenade_cd.start()
		grenade_thrown.emit(pos,player_direction)
	
func test_function():
	print("This is a test function")


func _on_laser_cd_timeout():
	can_laser = true
	


func _on_grenade_cd_timeout():
	can_grenade = true
