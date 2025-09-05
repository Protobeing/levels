extends Area2D
var speed = 0
func ready():
	
	pass
func _physics_process(delta):
	position += (Vector2.RIGHT * speed).rotated(rotation) * delta
	slime()
func slime():
	pass
func gone():
	$".".queue_free()
