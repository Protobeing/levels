extends PathFollow2D
var speed = .02






func _process(delta: float) -> void:
	progress_ratio += delta * speed
