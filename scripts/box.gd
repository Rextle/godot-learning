extends MeshInstance3D

var speed = 10
var max_health = 100
var current_health = 100
var min_health = 0.1
var heal = 1
var moving = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if moving and current_health < max_health:
		current_health += heal * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		moving = true
		if Input.is_action_just_released("ui_right"):
			moving = false
			print(current_health)
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
		moving = true
		if Input.is_action_just_released("ui_left"):
			moving = false
			print(current_health)
	if Input.is_action_pressed("ui_up"):
		position.z -= speed * delta
		moving = true
		if Input.is_action_just_released("ui_up"):
			moving = false
			print(current_health)
	if Input.is_action_pressed("ui_down"):
		position.z += speed * delta
		moving = true
		if Input.is_action_just_released("ui_down"):
			moving = false
			print(current_health)
	if Input.is_action_just_pressed("ui_accept"):
		take_damage(10)
		print(current_health )
	if moving and current_health < max_health:
		current_health += heal * delta

func take_damage(damage):
	if current_health > min_health:
		current_health -= damage
