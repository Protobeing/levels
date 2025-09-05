extends Area2D
func ready():
	
	pass
func _physics_process(delta):
	slime()
func slime():
	pass
func gone():
	$".".queue_free()
