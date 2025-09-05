extends Node2D

@onready var p0 = $p0.position
@onready var p1 = $p1.position
@onready var p2 = $p2.position
@onready var sprite = $Sprite2D
@onready var slider = $HSlider

var time = 0

func bezier(t):
	var q0 = p0.lerp(p1,t)
	var q1 = p1.lerp(p2,t)
	var r = q0.lerp(q1,t)
	return r
	
func _physics_process(delta: float) -> void:
	sprite.position = bezier(time)
	time += delta
	if time >= 1:
		time = 0
	#time = slider.value/100
