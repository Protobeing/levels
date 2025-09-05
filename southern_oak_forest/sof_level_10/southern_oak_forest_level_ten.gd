extends Node2D

@onready var anim = $AnimationPlayer
#group one
#var enemies_plus_six_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_plus_six_one.tscn')
#var enemies_plus_four_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_plus_four_one.tscn')
#var enemies_below_two_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_below_two_one.tscn')
#
#group two
#var enemies_plus_four_two: PackedScene = preload('res://enemies/groupings/group_two/enemies_plus_four_two.tscn')
#var enemies_below_two_two: PackedScene = preload('res://enemies/groupings/group_two/enemies_below_two_two.tscn')
#var enemies_plux_six_two: PackedScene = preload('res://enemies/groupings/group_two/enemies_plus_six_two.tscn')
@onready var Jed = $Jed
var ground_flame: PackedScene = preload('res://jed_main/rocks/ground_flame.tscn')
#group ten
var blue_healing: PackedScene = preload("res://numbers/blue_fire/blue_heal.tscn")
var enemies_plus_four_ten: PackedScene = preload('res://enemies/groupings/group_ten/enemies_plus_four_ten.tscn')
var enemies_below_two_ten: PackedScene = preload('res://enemies/groupings/group_ten/enemies_below_two_ten.tscn')
var enemies_plus_six_ten: PackedScene = preload('res://enemies/groupings/group_ten/enemies_plus_six_ten.tscn')
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

var boss_1: PackedScene = preload('res://enemies/groupings/boss_one/boss_one.tscn')
var boss_2: PackedScene = preload('res://enemies/groupings/boss_two/boss_two.tscn')
var boss_3: PackedScene = preload('res://enemies/groupings/boss_three/boss_three.tscn')
var boss_4: PackedScene = preload('res://enemies/groupings/boss_four/boss_four.tscn')
var boss_5: PackedScene = preload("res://enemies/groupings/boss_five/boss_five.tscn")

var bone = preload("res://drops/bone/bone.tscn")
var grubs: PackedScene = preload('res://drops/grub/grub.tscn')

func _ready():
	if Levels.time_to_hunt == false:
		if AudioPlayer.oak_forest_chill_vibes == false:
			AudioPlayer.oak_forest_chill_vibes = true
			AudioPlayer.play_song()
	if Levels.time_to_hunt:
		random_bosses()
		if AudioPlayer.deep_and_dark_it_is == false:
			AudioPlayer.deep_and_dark_it_is = true
			AudioPlayer.deep_and_darker()
	print(Levels.escaping,'= levels escape')
	Levels.escaping = false
	#if Global.chick_counter <=6:
		#if AudioPlayer.oak_forest_chill_vibes == false:
			#AudioPlayer.oak_forest_chill_vibes = true
			#AudioPlayer.play_song()
	PlayerData.death_in_sof_10 = false
	enemies_ten()
	Global.blue_flower_heal = true
	$Jed.position = Vector2(-350,351)
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
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		Levels.in_sof = true
		Levels._ready()
		


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
	PlayerData.death_in_sof_10 = true
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
	anim.play('poison')


func enemies_ten():
	if Global.chick_counter <= 3:
			var enemies = enemies_below_two_ten.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
			
	elif Global.chick_counter <= 7:
		if Global.chick_counter > 3:
			var enemies = enemies_plus_four_ten.instantiate()
			enemies.position = $".".position
			call_deferred("add_child",enemies)
	
	elif Global.chick_counter >= 8:
			var enemies = enemies_plus_six_ten.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)

func random_bosses():
		randomize()
		var rand_value = randi() % 5 # Generate a random number between 0 and 4
		match rand_value:
			0:
				boss_four()

			1:
				boss_three()
		

			2:
				boss_five()

			3:
				boss_one()
			4:
				boss_two()
			#5:
#
			#6:
#
			#7:
#
			#8:
#
			#9:
func boss_one():
	var boss = boss_1.instantiate()
	boss.position = $boss_marker.global_position
	call_deferred('add_child',boss)
func boss_two():
	var boss = boss_2.instantiate()
	boss.position = $boss_marker.global_position
	call_deferred('add_child',boss)
func boss_three():
	var boss = boss_3.instantiate()
	boss.position = $boss_marker.global_position
	call_deferred('add_child',boss)
func boss_four():
	var boss = boss_4.instantiate()
	boss.position = $boss_marker.global_position
	call_deferred('add_child',boss)
func boss_five():
	var boss = boss_5.instantiate()
	boss.position = $boss_marker.global_position
	call_deferred('add_child',boss)


func _on_zombie_rat_bones() -> void:
				var bone_times = bone.instantiate()
				bone_times.global_position = $zombie_rat.position
				add_child(bone_times)
				print('dropped bones')


func _on_zombie_rat_2_bones() -> void:
				var bone_times = bone.instantiate()
				bone_times.global_position = $zombie_rat2.position
				add_child(bone_times)
				print('dropped bones')


func _on_zombie_rat_3_bones() -> void:
				var bone_times = bone.instantiate()
				bone_times.global_position = $zombie_rat3.position
				add_child(bone_times)
				print('dropped bones')


func _on_zombie_rat_4_bones() -> void:
				var bone_times = bone.instantiate()
				bone_times.global_position = $zombie_rat4.position
				add_child(bone_times)
				print('dropped bones')


func _on_zombie_rat_5_bones() -> void:
				var bone_times = bone.instantiate()
				bone_times.global_position = $zombie_rat5.position
				add_child(bone_times)
				print('dropped bones')


func _on_zombie_rat_grub() -> void:
	var grub_time = grubs.instantiate()
	grub_time.global_position =$zombie_rat.position
	add_child(grub_time)


func _on_zombie_rat_2_grub() -> void:
	var grub_time = grubs.instantiate()
	grub_time.global_position = $zombie_rat2.position
	add_child(grub_time)


func _on_zombie_rat_3_grub() -> void:
	var grub_time = grubs.instantiate()
	grub_time.global_position = $zombie_rat3.position
	add_child(grub_time)


func _on_zombie_rat_4_grub() -> void:
	var grub_time = grubs.instantiate()
	grub_time.global_position = $zombie_rat4.position
	add_child(grub_time)


func _on_zombie_rat_5_grub() -> void:
	var grub_time = grubs.instantiate()
	grub_time.global_position = $zombie_rat5.position
	add_child(grub_time)


func _on_jed_blue_healed() -> void:
			var blue_heals = blue_healing.instantiate() 
			blue_heals.global_position  = $Jed.global_position
			add_child(blue_heals)
