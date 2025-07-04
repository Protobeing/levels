extends Node2D
@onready var anim = $AnimationPlayer
@onready var Jed = $Jed
var rocks: PackedScene = preload("res://jed_main/rocks/throwing_rock.tscn")
var pickup_rocks: PackedScene = preload("res://jed_main/rocks/rocks.tscn")
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
var steps: PackedScene = preload("res://jed_main/ready/foot_prints.tscn")
var stomp: PackedScene = preload("res://jed_main/stomp/stomp.tscn")
var flame: PackedScene = preload("res://jed_main/flame_dash/fire.tscn")
var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
var sweet_pea: PackedScene = preload("res://jed_main/sweet_pea_charge_attack/sweet_pea.tscn")
var ghost_jimmy = preload("res://spirit_jimmys/ghost_jimmy.tscn")
var ghost_jimmy_2 = preload("res://spirit_jimmys/ghost_jimmy_ver_two.tscn")
var bullets = preload("res://spirit_jimmys/ghost_bullets.tscn")
signal stop_global_counter

func _ready() -> void:
	AudioPlayer.oak_forest_chill_vibes = false
	Levels.reset()
	Levels.sof_level_counter = 0
	if Global.entity_count >= 10:
		anim.play('new_animation')
	stop_global_counter.emit()
	if PlayerData.in_tunnel:
		Jed.position = Vector2(366,112)
		PlayerData.in_tunnel = false
	if PlayerData.from_lvl_3:
		Jed.position = Vector2(63,-30)
	else:
		Jed.position = Vector2(426,427)
	if Global.chick_counter >= 1:
			var chick_1 = chick.instantiate()
			chick_1.position = $chick_spwns/chick_spawn_1.global_position
			add_child(chick_1)
	if Global.chick_counter >= 2:
			var chick_2 = chick.instantiate()
			chick_2.position = $chick_spwns/chick_spawn_2.global_position
			add_child(chick_2)
	if Global.chick_counter >= 3:
			var chick_3 = chick.instantiate()
			chick_3.global_position = $chick_spwns/chick_spawn_3.global_position
			add_child(chick_3)
	if Global.chick_counter >= 4:
			var chick_4 = chick.instantiate()
			chick_4.position = $chick_spwns/chick_spawn_4.global_position
			add_child(chick_4)
	if Global.chick_counter >= 5:
			var chick_5 = chick.instantiate()
			chick_5.position = $chick_spwns/chick_spawn_5.global_position
			add_child(chick_5)
	
func _on_entrance_to_tunnel_body_entered(body: Node2D) -> void:
	if body is Player:
		Levels.from_where_the_bugs_are = false
		Levels.from_boss_entrance = true
		get_tree().call_deferred('change_scene_to_file','res://tunnels/tunnel_one.tscn')

func _on_jed_rocks_e(pos, direction):
	var rock = rocks.instantiate() as RigidBody2D
	rock.position = pos
	rock.rotation = direction
	add_child(rock)
	await get_tree().create_timer(.5).timeout
	var pickup_rock = pickup_rocks.instantiate()
	pickup_rock.global_position = rock.position
	add_child(pickup_rock)
	rock.queue_free()
func _on_jed_special_attack(pos_sa,direction_sa):
	var sweet = sweet_pea.instantiate() as RigidBody2D
	sweet.position = pos_sa
	sweet.rotation = direction_sa
	add_child(sweet)
func _on_jed_step()-> void:
	var step = steps.instantiate()
	step.global_position = $Jed.position
	add_child(step)
func _on_jed_stomp()-> void:
	var stomp_cloud = stomp.instantiate()
	stomp_cloud.position = $Jed.position
	add_child(stomp_cloud)
func _on_jed_flame() -> void:
	var flames = flame.instantiate()
	flames.global_position = Jed.position
	add_child(flames)
func _on_jed_died() -> void:
	PlayerData.from_where_the_bugs_are = true
	#get_tree().change_scene_to_file('res://Jed-main/dead/death.tscn')
func _on_jed_ghosting() -> void:
	var Jims = ghost_jimmy.instantiate()
	Jims.global_position = Jed.position
	add_child(Jims)
	print('jim')
func _on_jed_ghosted() -> void:
	var spirit_jimmy = ghost_jimmy_2.instantiate()
	spirit_jimmy.global_position = Jed.position
	add_child(spirit_jimmy)
func _on_jed_orchid_poison() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Levels.from_entrance_to_the_long_path = true
		get_tree().call_deferred('change_scene_to_file','res://levels/southern_oak_forest/the_long_path/southern_oak_forest_lvl_3.tscn')


func _on_exit_sof_body_entered(body: Node2D) -> void:
	if body is Player:
		if Levels.time_to_hunt == false:
			if AudioPlayer.oak_forest_chill_vibes == false:
				AudioPlayer.oak_forest_chill_vibes = true
				AudioPlayer.play_song()
		if Levels.time_to_hunt:
			if AudioPlayer.deep_and_dark_it_is == false:
				AudioPlayer.deep_and_dark_it_is = true
				AudioPlayer.deep_and_darker()
		

		#get_tree().change_scene_to_file('res://sky/look_to_the_sky.tscn')
		#print('level one')
		Levels.in_sof = true
		Levels._ready()
