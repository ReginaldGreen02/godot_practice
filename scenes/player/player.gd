extends CharacterBody2D

signal laser_fired()
signal grenade_thrown()

var can_laser: bool = true
var can_grenade: bool = true

func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	#laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		laser_fired.emit()
		can_laser = false
		$laser_cd.start()
		
		
		
	
	if Input.is_action_pressed("secondary action") and can_grenade:
		grenade_thrown.emit()
		can_grenade = false
		$grenade_cd.start()
	
func test_function():
	print("This is a test function")


func _on_laser_cd_timeout():
	can_laser = true
	


func _on_grenade_cd_timeout():
	can_grenade = true
