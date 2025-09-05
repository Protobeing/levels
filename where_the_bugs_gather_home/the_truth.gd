extends Area2D
@onready var anims = $the_truth_anims
@onready var timer = $Timer
@onready var flower_anims = $"../Blue_flowers/AnimationPlayer"
func _ready():
	if Global.the_truth_has_played:
		$blood_on_the_ground.queue_free()
		timer.start()


func _on_body_entered(body: Node2D) -> void:
	if body is Player and Global.the_truth_has_played == false:
		Global.the_truth_has_played = true
		AudioPlayer.stop_all()
		$"../level_music".stop()
		anims.play("the_truth")
		print("the truth")


func _on_timer_timeout() -> void:
	flower_anims.play("no_heal")
