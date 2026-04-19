extends Node2D

@onready var parent  = get_parent()
@onready var cam = parent.get_node("Camera2D")
@onready var player = parent.get_node("player/Player")
@onready var player2 = parent.get_node("player/Player2")

func _physics_process(delta: float) -> void:
	if player == null || player2 == null:
		return
	if cam != null:
		if cam.position.y < get_viewport_rect().size.y/2:
			print(cam.position.y)
			position.y = cam.position.y - get_viewport_rect().size.y/2
	else:
		print("getting cam failed")
	if Input.is_action_just_pressed("control_menu"):
		if visible:
			visible = false
			player.disabled = false
			player2.disabled = false
		else:
			visible = true
			player.disabled = true
			player2.disabled = true



func _on_button_pressed() -> void:
	visible = false
	player.disabled = false
	player2.disabled = false
