extends CharacterBody2D
class_name Big_ol_rat
var health = 500
var player = null
var player_chase = false
var attacked = false
var attackable = true
var swing_counter: int = 0
@onready var seek = $seeker
@onready var idling_anim = $idle_anims
@onready var attack_anim = $attack_anims
var numbers: PackedScene = preload("res://numbers/damage_numbers/damage_numbers.tscn")
var not_thrown = true
var actions = [
		preload('res://enemies/lil_rat_1/lil_rat.tscn'), preload("res://enemies/Rolly_boy/rolly_boy.tscn")
	]
signal pipe_slime_S
signal pipe_slime_E
signal belch_1
signal belch_2
signal belch_3
signal belch_4
signal belch_5
signal belch_6
#signal rat
#signal rolly


func ready():
	randomize()
	player = get_parent().find_child('player')
	#actions = [
		#preload('res://levels/Oak_forest/Enemies/rat.tscn'), preload("res://levels/Oak_forest/Enemies/rolly_boy/rolly_boy.tscn")
	#]

func _on_trigger_random_action():
	# Select a random index from the array
	var random_index = randi() % actions.size()

	# Get the random action
	var action = actions[random_index]
		   # Check the type of action and execute accordingly
	if action is PackedScene:
		# If it's a scene, instantiate it
		var instance = action.instantiate()
		instance.position = $"../array_marker".global_position
		add_child(instance)
		print("Instantiated scene:", instance)
	if action is Callable:
		# If it's a function, call it
		action.call()
		print("Called function:", action)
	
func _physics_process(_delta):
	take_damage()
	enemy()
	time_to_belch()
	if player_chase and not_thrown:
		aim()
		#anim.play("throw_rock")
		#not_thrown = false
		#pause.start()
	move_and_slide()
func take_damage():
	if attacked and attackable:
		health = health - randi_range(8,10)
		var numbas = numbers.instantiate()
		numbas.get_node("Label").text = str(randi_range(8,12))  # Replace "LabelNodeName" with the actual name of the label node
		call_deferred('add_child', numbas)
		attackable = false
		$attackable_timer.start()
		print(health)
	if health <= 0:
		self.queue_free()
		get_tree().change_scene_to_file('res://menus_and_events/the end/the_end.tscn')
func _on_detection_area_body_entered(body):
		if body is Player:
			player = body
			player_chase = true
		
func _on_detection_area_body_exited(body):
		if body is Player:
			player = null
			player_chase = false
#func throw_rock():
	#var _nest = nest.instantiate()
	#_nest.position = position
	#_nest.direction = (raycast.target_position).normalized()
	#get_tree().current_scene.add_child(_nest)
	
func aim():
	seek.target_position = to_local(player.position)
func belch_one():
	belch_1.emit()
func belch_two():
	belch_2.emit()
func belch_three():
	belch_3.emit()
func belch_four():
	belch_4.emit()
func belch_five():
	belch_5.emit()
func belch_six():
	belch_6.emit()

func pipe_slime_south():
	pipe_slime_S.emit()
	
func pipe_slime_east():
	pipe_slime_E.emit()
	
func _on_pause_timeout():
	not_thrown = true

func _on_hit_points_area_entered(area):
	if area.has_method('hurt'):
		attacked = true

func _on_hit_points_area_exited(area):
	if area.has_method('hurt'):
		attacked = false

func _on_attackable_timer_timeout():
	attackable = true

func _on_south_swing_pipe_south():
	idling_anim.stop()
	attack_anim.play("swing_pipe_south")
func chillin():
	idling_anim.play("basic_idle")

func _on_east_swing_pipe_east():
	idling_anim.stop()
	attack_anim.play("swing_pipe_east")

func _on_spin_timer_timeout():
	idling_anim.stop()
	attack_anim.play("swing_pipe_in_circles")
func falls_down():
	attack_anim.stop()
	idling_anim.play("falls_down")
func get_up():
	attack_anim.stop()
	idling_anim.play('get_up')
func belch_pink_smoke():
	idling_anim.stop()
	attack_anim.play('Belch')
func rocks():
	pass
func enemy():
	pass
func count_swings():
	swing_counter = swing_counter+1
func time_to_belch():
	if swing_counter >= 8:
		_on_spin_timer_timeout()
		swing_counter = 0
		print('belch')
		
		
