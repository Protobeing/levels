extends Node2D
@onready var effects = $screen_effects
@onready var Jed = $Jed
#@onready var blue_flower_anim = $Blue_flowers/AnimationPlayer
@onready var enter_exit = $enter_exit
var counter = 0
var ground_flame: PackedScene = preload('res://jed_main/rocks/ground_flame.tscn')
# groups of enemies that sare instantiated according to how many chicks jed has with her

#group_one
var enemies_plus_six_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_plus_six_one.tscn')
var enemies_plus_four_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_plus_four_one.tscn')
var enemies_below_two_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_below_two_one.tscn')

#Jed's ability logic
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

func _ready() -> void:
	print(Levels.escape,'= levels escape')
	Levels.escape = false
	PlayerData.entering_from_s = true
	enter_exit.play("enter_from_s")
	if Global.chick_counter <=6:
		if AudioPlayer.oak_forest_chill_vibes == false:
			AudioPlayer.oak_forest_chill_vibes = true
			AudioPlayer.play_song()
		
	#if BlueFlowerCount.blue_flower_1:
		#blue_flower_anim.play("no_heal")
	PlayerData.death_in_sof_1 = false
	enemies_one()
	Global.blue_flower_heal = true
	$Jed.position = Vector2(0,611)
	if Global.chick_counter >= 1:
			var chick_1 = chick.instantiate()
			chick_1.global_position = $chick_spwns/chick_spawn_1.position
			add_child(chick_1)
	if Global.chick_counter >= 2:
			var chick_2 = chick.instantiate()
			chick_2.global_position =$chick_spwns/chick_spawn_2.position
			add_child(chick_2)
	if Global.chick_counter >= 3:
			var chick_3 = chick.instantiate()
			chick_3.global_position = $chick_spwns/chick_spawn_3.position
			add_child(chick_3)
	if Global.chick_counter >= 4:
			var chick_4 = chick.instantiate()
			chick_4.global_position = $chick_spwns/chick_spawn_4.position
			add_child(chick_4)
	if Global.chick_counter >= 5:
			var chick_5 = chick.instantiate()
			chick_5.global_position = $chick_spwns/chick_spawn_5.position
			add_child(chick_5)
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
	var flames = ground_flame.instantiate()
	flames.position = pickup_rock.position
	flames.rotation = direction
	add_child(flames)
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
	PlayerData.death_in_sof_1 = true
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


func _on_exit_sof_body_entered(body: Node2D) -> void:
	if body is Player:
		Levels.in_sof = true
		Levels._ready()


#func _on_blue_flowers_chick() -> void:
	##if BlueFlowerCount.blue_flower_1 == false:
	#Global.chick_counter = Global.chick_counter + 1
	#print(Global.chick_counter, "= Global chick counter")
		##BlueFlowerCount.blue_flower_1 = true
	#if Global.chick_counter <= 5:
			#var chicky = chick.instantiate()
			#chicky.global_position = $Blue_flowers.position
			#add_child(chicky)
		
# enemy groups logic

func enemies_one():
	if Global.chick_counter <= 3:
			var enemies = enemies_below_two_one.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
		
	elif Global.chick_counter <= 5:
		if Global.chick_counter > 3:
			var enemies = enemies_plus_four_one.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
		
	if Global.chick_counter >= 6:
			if AudioPlayer.deep_and_dark_it_is == false:
				AudioPlayer.deep_and_dark_it_is = true
				AudioPlayer.deep_and_dark_time.play('deep_and_dark')
			var enemies = enemies_plus_six_one.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
