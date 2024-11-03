extends Node2D
@export var guidance: Vector2 = Vector2()
@export var weight:float = 0
@onready var level_anim = $level_animations
@onready var Jed = $Jed
@onready var blue_flower_anim = $blue_flowers/Blue_flowers/AnimationPlayer
signal stop
signal start
signal fire_time
signal stop_global_counter
#@onready var flames = $Jed/torchlight/flame/fire/Marker2D
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
var fire_sound = preload('res://jed_main/flame_dash/fire_trail_sound.tscn')
#var slime: PackedScene = preload('res://levels/Oak_forest/Enemies/large_rat/slime_pool.tscn')
#var spear: PackedScene = preload("res://levels/Oak_forest/Enemies/large_rat/stick.tscn")
#@onready var intro = $INTRO

func _ready() -> void:
	stop_global_counter.emit()
	level_anim.play("fade_in")
	AudioPlayer.stop_all()
	if Global.chick_counter >= 7:
		AudioPlayer.deep_and_dark_it_is = false
	if Global.chick_counter <= 6:
		AudioPlayer.oak_forest_chill_vibes = false
	#AudioPlayer.oak_forest_chill_vibes = false
	#if BlueFlowerCount.blue_flower:
		#blue_flower_anim.play("no_heal")
	if PlayerData.from_coop:
		PlayerData.from_coop = false
		PlayerData.in_tunnel = false
		Jed.position = Vector2(1617,592)
		if Global.chick_counter >= 1:
				var chick_1 = chick.instantiate()
				chick_1.position = $chick_spawns_coop/chick_1_coop.global_position
				add_child(chick_1)
		if Global.chick_counter >= 2:
				var chick_2 = chick.instantiate()
				chick_2.position = $chick_spawns_coop/chick_2_coop.global_position
				add_child(chick_2)
		if Global.chick_counter >= 3:
				var chick_3 = chick.instantiate()
				chick_3.position = $chick_spawns_coop/chick_3_coop.global_position
				add_child(chick_3)
		if Global.chick_counter >= 4:
				var chick_4 = chick.instantiate()
				chick_4.position = $chick_spawns_coop/chick_4_coop.global_position
				add_child(chick_4)
		if Global.chick_counter >= 5:
				var chick_5 = chick.instantiate()
				chick_5.position = $chick_spawns_coop/chick_5_coop.global_position
				add_child(chick_5)
	if PlayerData.in_tunnel:
		PlayerData.from_coop = false
		PlayerData.in_tunnel = false
		Jed.position = Vector2(1582,129)
		if Global.chick_counter >= 1:
				var chick_1 = chick.instantiate()
				chick_1.position = $chick_spawns_tunnel/chick_spawn_tunnel_1.global_position
				add_child(chick_1)
		if Global.chick_counter >= 2:
				var chick_2 = chick.instantiate()
				chick_2.position = $chick_spawns_tunnel/chick_spawn_tunnel_2.global_position
				add_child(chick_2)
		if Global.chick_counter >= 3:
				var chick_3 = chick.instantiate()
				chick_3.position = $chick_spawns_tunnel/chick_spawn_tunnel_3.global_position
				add_child(chick_3)
		if Global.chick_counter >= 4:
				var chick_4 = chick.instantiate()
				chick_4.position = $chick_spawns_tunnel/chick_spawn_tunnel_4.global_position
				add_child(chick_4)
		if Global.chick_counter >= 5:
				var chick_5 = chick.instantiate()
				chick_5.position = $chick_spawns_tunnel/chick_spawn_tunnel_5.global_position
				add_child(chick_5)
	print('global chick counter', Global.chick_counter)
	Global.blue_flower_heal = true
	if Levels.boss_is_near:
		Levels.sof_level_counter = 0

		Levels.sof_one = false

		Levels.sof_two = false

		Levels.sof_three = false

		Levels.sof_four = false
		
		Levels.sof_five = false
		
		Levels.sof_six = false
		
		Levels.sof_seven = false
		
		Levels.sof_eight = false
		
		Levels.sof_nine = false
		
		Levels.sof_ten = false
		
	if Levels.tunnel_one_open:
		level_anim.play("tunnel_reveal")
	#if PlayerData.in_tunnel == false:
		#Jed.position = Vector2(1617,592)
		#if Global.chick_counter >= 1:
				#var chick_1 = chick.instantiate()
				#chick_1.position = $chick_spawns_coop/chick_1_coop.global_position
				#add_child(chick_1)
		#if Global.chick_counter >= 2:
				#var chick_2 = chick.instantiate()
				#chick_2.position = $chick_spawns_coop/chick_2_coop.global_position
				#add_child(chick_2)
		#if Global.chick_counter >= 3:
				#var chick_3 = chick.instantiate()
				#chick_3.position = $chick_spawns_coop/chick_3_coop.global_position
				#add_child(chick_3)
		#if Global.chick_counter >= 4:
				#var chick_4 = chick.instantiate()
				#chick_4.position = $chick_spawns_coop/chick_4_coop.global_position
				#add_child(chick_4)
		#if Global.chick_counter >= 5:
				#var chick_5 = chick.instantiate()
				#chick_5.position = $chick_spawns_coop/chick_5_coop.global_position
				#add_child(chick_5)
	#if Global.chick_counter >= 1:
			#var chick_1 = chick.instantiate()
			#chick_1.global_position = $ghost_chicks_positions/ghost_chick_one.position
			#add_child(chick_1)


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
	if Global.on_fire == false:
		fire_time.emit()
func _on_fire_time() -> void:
		var sound = fire_sound.instantiate()
		sound.global_position = Jed.position
		call_deferred('add_child',sound)

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

func _on_ghost_jimmy_ver_two_shooting() -> void:
	var ghosty_bullets = bullets.instantiate()
	ghosty_bullets.global_position = $Ghost_Jimmy_ver_two.position
	add_child(ghosty_bullets)

func _on_blue_flowers_chick()-> void:
	if BlueFlowerCount.blue_flower == false:
		Global.chick_counter = Global.chick_counter + 1
		print(Global.chick_counter, "= Global chick counter")
		BlueFlowerCount.blue_flower = true
	if BlueFlowerCount.blue_flower:
		blue_flower_anim.play("no_heal")
		
	if Global.chick_counter <= 5:
			var chicky = chick.instantiate()
			chicky.global_position = $Blue_flowers.position
			add_child(chicky)



func _on_mage_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage.position
	add_child(prayer)
func _on_mage_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage.position
	call_deferred('add_child', skulls)




func _jed_needs_an_explanation():
	stop.emit()
	
	#$Jeds_timer.start()
	#Jed.position = lerp(Jed.position,guidance,weight)
func _on_jeds_timer_timeout() -> void:
	start.emit()
	
	
func _on_tunnel_one_entrance_body_entered(body: Node2D) -> void:
	if body is Player:
		Levels.from_boss_entrance = false
		Levels.from_where_the_bugs_are = true
		get_tree().change_scene_to_file('res://tunnels/tunnel_one.tscn')
