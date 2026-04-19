extends Node2D

var L_1 = "res://scenes/l_1.tscn"
var reset = false

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(L_1)

func _physics_process(delta: float) -> void:
	if reset == true:
		get_tree().change_scene_to_file(L_1)
	
	if Input.is_action_just_pressed("control_menu"):
		reset = true
