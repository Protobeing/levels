extends RayCast2D
signal swing_pipe_east
var not_attacking = true

func ready():
	pass
	
func _process(_delta):
	if is_colliding() and not_attacking:
		swing_pipe_east.emit()
		not_attacking = false
		$east_raycast_timer.start()
		print('swing')





func _on_east_raycast_timer_timeout():
	not_attacking = true
