extends Node2D
#@onready var level_anim = $level_animations
@onready var Jed = $Jed
@onready var blue_flower_anim = $Blue_flowers/AnimationPlayer
# groups of enemies that sare instantiated according to how many chicks jed has with her

#pink orb's "legs"
@onready var right_front_leg: PackedScene = preload("res://enemies/entity/rightish_leg_front.tscn")
@onready var left_front_leg: PackedScene = preload("res://enemies/entity/leftish_leg_front.tscn")
@onready var right_back_leg: PackedScene = preload("res://enemies/entity/rightish_leg_back.tscn")
@onready var left_back_leg: PackedScene = preload("res://enemies/entity/leftish_leg_back.tscn")
@onready var Splatter = $pink_orb/splat
#group_one
var enemies_plus_six_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_plus_six_one.tscn')
var enemies_plus_four_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_plus_four_one.tscn')
var enemies_below_two_one: PackedScene = preload('res://enemies/groupings/group_one/enemies_below_two_one.tscn')

#group_two
var enemies_plus_four_two: PackedScene = preload('res://enemies/groupings/group_two/enemies_plus_four_two.tscn')
var enemies_below_two_two: PackedScene = preload('res://enemies/groupings/group_two/enemies_below_two_two.tscn')
var enemies_plux_six_two: PackedScene = preload('res://enemies/groupings/group_two/enemies_plus_six_two.tscn')
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
@onready var intro = $INTRO
#rolly boys
var fart: PackedScene = preload('res://enemies/Rolly_boy/fart_ring.tscn')
var puddle: PackedScene = preload('res://enemies/Rolly_boy/puddle_of_pink_ooze.tscn')
# Rat_puddle_factory
@onready var snot_puddle = preload("res://levels/test/Bezier_curves/snot_puddle.tscn")

func _ready():
	PlayerData.test = false
	intro.play('fade_in')
	#$Jed.position = Vector2(179,209)
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
func _on_blue_flowers_chick():
	if BlueFlowerCount.blue_flower_1 == false:
		Global.chick_counter = Global.chick_counter + 1
		print(Global.chick_counter, "= Global chick counter")
		if Global.chick_counter <= 5:
			var chicky = chick.instantiate()
			chicky.global_position = $Ghost_flowers/Blue_flowers.position
			add_child(chicky)
		BlueFlowerCount.blue_flower_1 = true
		

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
			Levels.in_sof = true
			Levels._ready()



func enemies_one():
	if Global.chick_counter <= 3:
			var enemies = enemies_below_two_one.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
		
	elif Global.chick_counter <= 6:
		if Global.chick_counter > 3:
			var enemies = enemies_plus_four_one.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
		
	elif Global.chick_counter <= 8:
		if Global.chick_counter > 6:
			var enemies = enemies_plus_six_one.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
func enemies_two():
	if Global.chick_counter <= 3:
			var enemies = enemies_below_two_two.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
	elif Global.chick_counter <= 6:
		if Global.chick_counter > 3:
			var enemies = enemies_plus_four_two.instantiate()
			enemies.position = $".".position
			call_deferred("add_child",enemies)
	
	elif Global.chick_counter >= 7:
			var enemies = enemies_plux_six_two.instantiate()
			enemies.position = $".".position
			call_deferred('add_child', enemies)
			

func _on_pink_orb_left_back() -> void:
	var left_backish = left_back_leg.instantiate()
	left_backish.position = Splatter.global_position
	call_deferred("add_child",left_backish)


func _on_pink_orb_left_front() -> void:
	var left_frontish = left_front_leg.instantiate()
	left_frontish.position = Splatter.global_position
	call_deferred('add_child', left_frontish)
	

func _on_pink_orb_right_back() -> void:
	var right_backish = right_back_leg.instantiate()
	right_backish.position = Splatter.global_position
	call_deferred('add_child',right_backish)
	
func _on_pink_orb_right_front() -> void:
	var right_frontish = right_front_leg.instantiate()
	right_frontish.position = Splatter.global_position
	call_deferred('add_child',right_frontish)


func _on_jed_died() -> void:
	PlayerData.test = true
	get_tree().change_scene_to_file('res://Jed-main/dead/death.tscn')


func _on_rolly_boy_fart() -> void:
	var farty = fart.instantiate()
	farty.position = $rolly_boy.global_position
	call_deferred('add_child', farty)
func _on_rolly_boy_puddle() -> void:
	var puddles = puddle.instantiate()
	puddles.position = $rolly_boy.global_position
	call_deferred('add_child', puddles)


func _on_mage_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage.position
	add_child(prayer)

func _on_mage_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage.position
	call_deferred('add_child', skulls)


func _on_rat_puddle_factory_snot_e(pos) -> void:
	var snot_e = snot_puddle.instantiate()
	snot_e.global_position = pos.position
	add_child(snot_e)
	print('puddle')
