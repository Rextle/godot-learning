extends Area2D

func _ready() -> void:
	pass 

func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.up_hp(2)
		print(body.hp)
		queue_free()
