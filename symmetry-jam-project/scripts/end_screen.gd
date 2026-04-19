extends Node2D

var title = "res://scenes/title_screen.tscn"

var reset = false

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(title)

func _physics_process(delta: float) -> void:
	if reset == true:
		get_tree().change_scene_to_file(title)
	
	if Input.is_action_just_pressed("control_menu"):
		reset = true
