extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export var mirror : int

var kiss = 0
var speed = 50
var direction = Vector2 (0,0)

var can_jump = true
var is_jumping = false
var time = 10 * 60
var jump_timer = time
var jumped_once = false

var gravity = 0.1

var max_velocity = Vector2 (500,500)

func walking_controller(delta):
	if Input.is_action_pressed("move_left"):
		direction.x = -1
		animated_sprite.play("walking_left")
	elif Input.is_action_pressed("move_right"):
		direction.x = 1
		animated_sprite.play("walking_right")
	else:
		direction.x = 0
		animated_sprite.play("default")

func jumping_controller():
	if !is_on_floor():
		
		if direction.y < max_velocity.y:
			direction.y += gravity
	else:
		is_jumping = false
		can_jump = true
		jumped_once = false
		jump_timer = time
	
	if is_on_ceiling():
		direction.y = 0
		direction.y += gravity
	
	if Input.is_action_just_pressed("move_up") && can_jump:
		print(jumped_once)
		if jumped_once:
			jump()
			can_jump = false
		else:
			jump()
			jumped_once = true


func _physics_process(delta: float) -> void:
	if mirror <0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	
	walking_controller(delta)
	jumping_controller()
	
	direction.x *= mirror
	
	self.velocity = speed * direction
	self.move_and_slide()

func jump():
	if jump_timer <= 0:
		can_jump = false
	else:
		jump_timer -= 1
	direction.y = -3




func _on_detection_body_entered(body: Node2D) -> void:
	if body.name.contains("Player"):
		kiss += 1
		print("kiss ", kiss)
		if kiss >= 2:
			#play animation
			#switch level
			pass
