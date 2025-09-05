extends Node2D
var puddle_is_dead = false
@onready var entity_mark = $entity_marker
@onready var anim = $AnimationPlayer
@onready var Jed = $Jed
@onready var tun_block = $tunnel_block
#@onready var sign_anims = $back_to_the_woods
@onready var rat_puddle: PackedScene = preload("res://enemies/Rat_Puddle_Factory/rat_puddle_factory.tscn")
var back_to_the_woods: PackedScene = preload("res://back_to_the_woods.tscn")
var rocks: PackedScene = preload("res://jed_main/rocks/throwing_rock.tscn")
var pickup_rocks: PackedScene = preload("res://jed_main/rocks/rocks.tscn")
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
var steps: PackedScene = preload("res://jed_main/ready/foot_prints.tscn")
var stomp: PackedScene = preload("res://jed_main/stomp/stomp.tscn")
var flame: PackedScene = preload("res://jed_main/flame_dash/fire.tscn")
var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
var entity: PackedScene = preload('res://enemies/entity/the_entity.tscn')
var sweet_pea: PackedScene = preload("res://jed_main/sweet_pea_charge_attack/sweet_pea.tscn")
var ghost_jimmy = preload("res://spirit_jimmys/ghost_jimmy.tscn")
var ghost_jimmy_2 = preload("res://spirit_jimmys/ghost_jimmy_ver_two.tscn")
var bullets = preload("res://spirit_jimmys/ghost_bullets.tscn")
@onready var thoughts = $Jed/jeds_thought_marker
signal stop_global_counter
var blue_healing: PackedScene = preload("res://numbers/blue_fire/blue_heal.tscn")
func _ready() -> void:
	if Levels.time_to_hunt:
		#if AudioPlayer.deep_and_dark_it_is == false:
			AudioPlayer.deep_and_darker()
	Jed.position = Vector2(406,356)
	if Global.puddle_is_dead:
		$gate_block.queue_free()
	if Global.gate_two == false:
		Global.gate_counter += 1
		Global.gate_two = true
	AudioPlayer.oak_forest_chill_vibes = false
	Levels.reset()
	Levels.sof_level_counter = 0


	if Global.entity_count >= 9:
		AudioPlayer.stop_all()
		AudioPlayer.rat_pudds()
		if Global.puddle_is_dead == false:
			var puddle = rat_puddle.instantiate()
			puddle.position = $rat_puddle_marker.position
			add_child(puddle)
			#anim.play('new_animation')
			#if Global.entity_count >= 10:
			#anim.play("new_animation")
	stop_global_counter.emit()
	if PlayerData.in_tunnel:
		Jed.position = Vector2(366,112)
	if PlayerData.from_lvl_3:
		Jed.position = Vector2(63,-30)
	if PlayerData.from_lvl_3 == false:
		if PlayerData.in_tunnel == false:
			Jed.position = Vector2(406,356)
	if PlayerData.death_final_gate:
		Jed.position = Vector2(406,356)
		PlayerData.death_final_gate = false
	PlayerData.in_tunnel = false
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
func _process(delta: float) -> void:
	if Global.puddle_is_dead == true and puddle_is_dead == false:
		_on_rat_puddle_factory_dead()
		puddle_is_dead = true
	
func entities():
		var ent = entity.instantiate()
		ent.position = entity_mark.position
		add_child(ent)
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
	#PlayerData.from_where_the_bugs_are = true
	PlayerData.from_lvl_3 = false
	PlayerData.in_tunnel = false
	PlayerData.death_final_gate = true
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


func _on_rat_puddle_factory_dead() -> void:
	var ent = entity.instantiate()
	ent.position = $rat_puddle_marker.position
	add_child(ent)
	anim.play("new_animation")
	print('puddle is dead')
func _on__great_oak_gate_back_to_the_woods() -> void:
	var back = back_to_the_woods.instantiate()
	back.position = thoughts.position
	add_child(back)
func add_to_global_gate_count():
	Global.gate_counter += 1
func _on_jed_blue_healed() -> void:
			var blue_heals = blue_healing.instantiate() 
			blue_heals.global_position  = $Jed.global_position
			add_child(blue_heals)
func bye_tunnel_block():
	tun_block.queue_free()
