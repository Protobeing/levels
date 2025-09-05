extends RayCast2D
signal swing_pipe_south
var not_attacking = true

func ready():
	pass
	
func _process(_delta):
	if is_colliding() and not_attacking:
		swing_pipe_south.emit()
		not_attacking = false
		$south_raycast_timer.start()
		print('swing')


func _on_south_raycast_timer_timeout():
	not_attacking = true
