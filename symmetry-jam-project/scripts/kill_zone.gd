extends Area2D

var reset = false

func _on_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		reset = true
		

func _physics_process(delta: float) -> void:
	if reset == true:
		get_tree().reload_current_scene()
