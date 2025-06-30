extends Node2D

class_name node


func _ready():
	var one = preload('res://levels/southern_oak_forest/sof_level_1/southern_oak_forest_level_one.tscn')
	var load = one.instantiate()
	call_deferred('add_child',load)
