extends Node2D

var title = "res://title_screen.tscn"



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(title)
