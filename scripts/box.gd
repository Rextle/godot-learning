extends MeshInstance3D

var speed = 10

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_up"):
		position.z -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.z += speed * delta
