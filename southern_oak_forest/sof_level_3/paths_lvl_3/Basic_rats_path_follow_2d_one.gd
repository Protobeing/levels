extends PathFollow2D

var speed = .01





func _process(delta: float) -> void:
	progress_ratio += delta * speed
