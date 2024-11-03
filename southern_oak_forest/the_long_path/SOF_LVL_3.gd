extends Node2D
var died = false
var player: PackedScene = preload("res://jed_main/Jed.tscn")

#var rat_lvl_3: PackedScene = preload('the_long')
#var level_3: PackedScene = preload("res://levels/Oak_forest/southern_oak_forest_lvl_3.tscn")
#var rat_lvl_2: PackedScene = preload("res://levels/Oak_forest/Enemies/rats_SOF_lvl_2.tscn")
#var level_2: PackedScene = preload("res://levels/Oak_forest/southern_oak_forest_lvl_2.tscn")
#var Land_bridgy_two: PackedScene = preload('res://levels/Oak_forest/land_bridge_to_level_3.tscn')
var steps: PackedScene = preload("res://jed_main/ready/foot_prints.tscn")
var stomp: PackedScene = preload("res://jed_main/stomp/stomp.tscn")
var rocks: PackedScene = preload("res://jed_main/rocks/throwing_rock.tscn")
var pickup_rocks: PackedScene = preload("res://jed_main/rocks/rocks.tscn")
var flame: PackedScene = preload("res://jed_main/flame_dash/fire.tscn")
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
#var slime: PackedScene = preload('res://levels/Oak_forest/Enemies/large_rat/slime_pool.tscn')
#var spear: PackedScene = preload("res://levels/Oak_forest/Enemies/large_rat/stick.tscn")
#var tunnel_one_ins: PackedScene = preload("res://levels/Oak_forest/Earth/tunnel_one/tunnel_one_entrance.tscn")
#var tunnel_two_ins: PackedScene = preload('res://levels/Oak_forest/Earth/tunnel_two/tunnel_two_entrance.tscn')
@onready var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
@onready var JED = $Jed
#var _rats_home: PackedScene = preload("res://levels/Oak_forest/Enemies/rats_home.tscn")
#var _log_exit = preload("res://levels/Oak_forest/other/inside_log_entrance.tscn")
@onready var bullets = preload("res://spirit_jimmys/ghost_bullets.tscn")
@onready var GHost_jimmy_two = preload("res://spirit_jimmys/ghost_jimmy_ver_two.tscn")
var chick_counter = 0 

func _ready():
	pass
	#print(PlayerData.tunnel_one, '= tunnel_one')
	#if PlayerData.tunnel_one == true:
		#JED.position = $exit_tunnel_to_lvl_1.global_position
		#print('did_it')
		#var tunnl = tunnel_one_ins.instantiate()
		#tunnl.global_position = $"../Dummy/tunnel_to_lvl_1".position
		#add_child(tunnl)
		#print(PlayerData.tunnel_one,'=tunnel one')
	#if PlayerData.tunnel_two == true:
		#var tunnl = tunnel_two_ins.instantiate()
		#tunnl.global_position = $"../tunnel_two_marker".position
		#add_child(tunnl)
		#print(PlayerData.tunnel_one,'=tunnel one')
	#if PlayerData.save_lvl_2:
			#JED.global_position = $Dummy/exit_tunnel_to_lvl_1.global_position
			#PlayerData.save_lvl_2 = false
	#if PlayerData.save_lvl_3:
			#$Jed.position = PlayerData.saved_player_position
			#level_3_appear()
			#level_3_rats()
			#$home.is_queued_for_deletion()
			#$rats_home.is_queued_for_deletion()
			#$level_3_trigger.is_queued_for_deletion()
			#$Land_Bridge_Home.is_queued_for_deletion()
			#BuhBye_home()
			#PlayerData.save_lvl_3 = false
			
			
func _process(_delta):
	pass

func _on_jed_step():
	var step = steps.instantiate()
	step.global_position = JED.position
	add_child(step)


func _on_jed_stomp():
	var stomp_cloud = stomp.instantiate()
	stomp_cloud.position = JED.position
	add_child(stomp_cloud)
	
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

func _on_jed_flame():
	var flames = flame.instantiate()
	flames.global_position = JED.position
	add_child(flames)

func _on_blue_flowers_chick():
	if BlueFlowerCount.blue_flower_7 == false:
		Global.chick_counter = Global.chick_counter + 1
		if Global.chick_counter <= 5:
			var chicky = chick.instantiate()
			chicky.global_position = $blue_flowers/Blue_flowers.position
			add_child(chicky)
		BlueFlowerCount.blue_flower_7 = true
func _on_blue_flowers_2_chick():
	if BlueFlowerCount.blue_flower_8 == false:
		Global.chick_counter = Global.chick_counter + 1
		if Global.chick_counter <= 5:
			var chicky = chick.instantiate()
			chicky.global_position = $blue_flowers/Blue_flowers2.position
			add_child(chicky)
		BlueFlowerCount.blue_flower_8 = true





func _on_mage_spell():
	var prayer = spell.instantiate()
	prayer.global_position = $mage.position
	add_child(prayer)


#func _on_area_2d_body_entered(body):
	#if body is Player:
		#get_tree().change_scene_to_file("res://levels/Oak_forest/other/inside_log.tscn")
		#$"..".visible = false
		#var inside_log = _inside_log.instantiate()
		#inside_log.global_position = $Jed.position
		#add_child(inside_log)
		#$home.queue_free()
		#$rats_home.queue_free()
		#$Area2D.queue_free()
		#$"..".visible = true
#func switch_level(new_level_path):
	## Save current player state to PlayerData singleton before switching level
		#PlayerData.player_health = health
#
		#PlayerData.player_position = position
		
# Change the scene
		#var new_level = ResourceLoader.load(new_level_path)
		#get_tree().change_scene_to(new_level)
#func saved_player_position():
	#PlayerData.saved_player_position = $Jed.position
	#print(PlayerData.saved_player_position, "PlayerData.saved_player_position")
#func load_saved_player_position():
	#$Jed.position = PlayerData.saved_player_position
	#print(PlayerData.saved_player_position, "PlayerData.saved_player_position")
#func save_player_position():
	#PlayerData.player_position = $Jed.position
	#print(PlayerData.player_position, "PlayerData.player_position")
#func load_player_position():
	#$Jed.position = PlayerData.player_position
	#print(PlayerData.player_position, "PlayerData.player_position")
#func _on_large_rat_slimes():
	#var sliming = slime.instantiate()
	#sliming.global_position = $large_rat.position
	#add_child(sliming)
#
#
#func _on_large_rat_spearing():
	#var spears = spear.instantiate()
	#spears.global_position = $large_rat.position
	#add_child(spears)



func _on_mage_counter():
	pass # Replace with function body.


func _on_mage_skull():
	var skulls = skull.instantiate()
	skulls.global_position = $mage.position
	call_deferred('add_child', skulls)


func _on_jed_pause_game():
	pass # Replace with function body.


func _on_jed_stop(stop_scene):
	pass # Replace with function body.


func _on_jed_unpause_game():
	pass # Replace with function body.



#
#func _on_to_the_bogs_body_entered(body):
	#if body is Player:
		##saved_player_position()
		#get_tree().change_scene_to_file('res://levels/Oak_forest/SOF_bogs_lvl_one.tscn')


func _on_jed_ghosting():
	var Jims = GHost_jimmy_two.instantiate()
	Jims.global_position = JED.position
	add_child(Jims)
	print('jim')


func _on_ghost_jimmy_ver_two_shooting():
	var ghosty_bullets = bullets.instantiate()
	ghosty_bullets.global_position = $Ghost_Jimmy_ver_two.position
	add_child(ghosty_bullets)


#func _on_jed_chicks():
	#var chicky = chick.instantiate()
	#chicky.global_position = $Jed.position
	#add_child(chicky)
	#print("chick on SOF")

func _on_jed_ghosted():
	var ghost_jimmy_two = GHost_jimmy_two.instantiate()
	ghost_jimmy_two.global_position = JED.position
	add_child(ghost_jimmy_two)


#func _on_sav_pos_log_body_entered(body):
	#save_player_position()
#
#
#func _on_sav_pos_coop_body_entered(body):
	#save_player_position()


#func _on_saved_spot_lvl_2_body_entered(body):
	#if body is Player:
		#PlayerData.at_level_2_save = true
#
#
#func _on_saved_spot_lvl_2_body_exited(body):
	#if body is Player:
		#PlayerData.at_level_2_save = false
#
#func _on_tin_hat_body_entered(body):
	#if body is Rock:
		##saved_player_position()
		#pass


func _on_jed_died():
	PlayerData.from_lvl_3 = true
	print('jed died')
#func _on_sof_lvl_3_save_point_body_entered(body):
	#if body is Player:
		#PlayerData.at_level_3_save = true
#func _on_sof_lvl_3_save_point_body_exited(body):
	#if body is Player:
		#PlayerData.at_level_3_save = false
