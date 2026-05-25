extends ColorRect

var speed = 200
var max_health = 100
var current_health = 100
var min_health = 0
var heal = 100
var moving = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	moving = Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_down")
	if moving and current_health < max_health:
		current_health += heal * delta
		current_health = round(current_health)
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		print(current_health)
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
		print(current_health)
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
		print(current_health)
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
		print(current_health)
	if Input.is_action_just_pressed("ui_accept"):
		take_damage(10)
		print(current_health )
		

func take_damage(damage):
	current_health -= damage
	if current_health <= 0:
		current_health = 0
		print("You died")


	
