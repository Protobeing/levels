extends Area2D
@onready var anims = $the_truth_anims



func _on_body_entered(body: Node2D) -> void:
	if body is Player and Global.the_truth_has_played == false:
		Global.the_truth_has_played = true
		anims.play("the_truth")
		print("the truth")
