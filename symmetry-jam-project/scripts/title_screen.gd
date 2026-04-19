extends Node2D

var L_1 = "res://scenes/l_1.tscn"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(L_1)
