extends CharacterBody2D

var gravity = 980
var speed = 200

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	move_and_slide()
