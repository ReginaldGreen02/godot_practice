extends Node2D


func _on_gate_player_entered_gate(body):
	print("player has entered")
	print(body)

func _on_player_laser_fired():
	print("laser from level")

func _on_player_grenade_thrown():
	print("grenade from level")
