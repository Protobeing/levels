extends Area2D

@onready var oaky = $AnimationPlayer
@onready var stop_it = $stop
func ready():
	pass
func process():
	pass
	
	


func _on_body_entered(_body):
	oaky.play("rustling")
	



func _on_body_exited(_body):
	stop_it.start()
	


func _on_stop_timeout():
	oaky.stop()
