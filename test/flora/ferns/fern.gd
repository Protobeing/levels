extends Area2D

@onready var anim = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


		


func _on_body_entered(_body):
	anim.play("new_animation")
