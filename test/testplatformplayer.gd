extends CharacterBody2D

var gravity = 980
var speed = 200
var max_hp = 100
var min_hp = 0
var hp = 100
var score = 0

func _physics_process(delta: float) -> void:
	
	velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = -700
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
		
	%ScoreLabel.text = "Score: " + str(score)
	%HpLabel.text = "HP: " + str(hp)
	%TimerLabel.text = "Time: " + str(ceil(%Timer.time_left))
	
	move_and_slide()

func the_score(xscore):
	score += xscore

func up_hp(heal):
	if hp < max_hp:
		hp += heal

func down_hp(dmg):
	if hp > min_hp:
		hp -= dmg
	if hp <= 0:
		hp = 0
		print("You died")

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
