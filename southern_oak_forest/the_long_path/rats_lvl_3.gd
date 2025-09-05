extends Node2D
@onready var gate_anim_two = $gate_block_west/AnimationPlayer
@onready var gate_anim_one = $gate_block_north/AnimationPlayer
@onready var gate_anim_three = $gate_block_north2/AnimationPlayer
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
@onready var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
@onready var farty: PackedScene = preload("res://enemies/Rolly_boy/fart_ring.tscn")
@onready var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
@onready var puddle: PackedScene = preload('res://enemies/entity/puddle_of_pink_ooze.tscn')
#@onready var Effects = $fight_effects
@onready var dropped: PackedScene = preload('res://enemies/entity/drop_rat.tscn')
@onready var little_rat:PackedScene = preload('res://enemies/lil_rat_1/lil_rat.tscn')
#pink orb's "legs"

@onready var right_front_leg: PackedScene = preload("res://enemies/entity/rightish_leg_front.tscn")
@onready var left_front_leg: PackedScene = preload("res://enemies/entity/leftish_leg_front.tscn")
@onready var right_back_leg: PackedScene = preload("res://enemies/entity/rightish_leg_back.tscn")
@onready var left_back_leg: PackedScene = preload("res://enemies/entity/leftish_leg_back.tscn")
@onready var Splatter_one =$pink_orb
#@onready var Splatter_two = $pink_orb2

var entity: PackedScene = preload("res://enemies/entity/the_entity.tscn")
var death_count = 0
var counter = 0
var counted = true
func _physics_process(_delta):
	pass
func count_rats():
	if counter == 125:
		pass
func _on_rolly_boy_count() -> void:
	counter = counter +1
	if counter >= 1 and counted:
		counted = false
		gate_anim_two.play("player_wins")
		#$chicks/feather_drop.play("feather_drop")
func _on_rolly_boy_7_count() -> void:
	pass # Replace with function body.
func _on_rolly_boy_8_count() -> void:
	pass
func _on_rolly_boy_fart() -> void:
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy.position
	add_child(fart)
func _on_rolly_boy_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy.position
	add_child(pink_puddle)
func _on_rolly_boy_7_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy7.position
	add_child(fart)
func _on_rolly_boy_7_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy7.position
	add_child(pink_puddle)
func _on_rolly_boy_8_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy8.position
	add_child(fart)
func _on_rolly_boy_8_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy8.position
	add_child(pink_puddle)

func _on_mage_spell():
	var prayer = spell.instantiate()
	prayer.global_position = $mage.position
	add_child(prayer)
func _on_mage_2_spell():
	var prayer = spell.instantiate()
	prayer.global_position = $mage2.position
	add_child(prayer)
func _on_mage_3_spell():
	var prayer = spell.instantiate()
	prayer.global_position = $mage3.position
	add_child(prayer)
func _on_mage_skull():
	var skulls = skull.instantiate()
	skulls.global_position = $mage.position
	call_deferred('add_child', skulls)
func _on_mage_2_skull():
	var skulls = skull.instantiate()
	skulls.global_position = $mage2.position
	call_deferred('add_child', skulls)
func _on_mage_3_skull():
	var skulls = skull.instantiate()
	skulls.global_position = $mage3.position
	call_deferred('add_child', skulls)
#func _on_lil_rat_count():
	#counter = counter + 1
	#print(counter,"=counter")
func _on_mage_counter():
	var curing = entity.instantiate()
	curing.global_position = $mage.position
	add_child(curing)
	gate_anim_three.play('escaped')
func _on_mage_2_counter():
	var curing = entity.instantiate()
	curing.global_position = $mage2.position
	add_child(curing)
	gate_anim_one.play("escaped")
func _on_mage_3_counter():
	var curing = entity.instantiate()
	curing.global_position = $mage3.position
	add_child(curing)



func _on_blue_flowers_chick() -> void:
		#if BlueFlowerCount.blue_flower_1 == false:
	Global.chick_counter = Global.chick_counter + 1
	print(Global.chick_counter, "= Global chick counter")
		#BlueFlowerCount.blue_flower_1 = true
	#if Global.chick_counter <= 5:
	var chicky = chick.instantiate()
	chicky.global_position = $chicks/Blue_flowers.position
	add_child(chicky)


func _on_pink_orb_death() -> void:
	var escaped = entity.instantiate()
	escaped.global_position = $pink_orb.position
	call_deferred('add_child',escaped)


func _on_pink_orb_left_back() -> void:
	var left_backish = left_back_leg.instantiate()
	left_backish.position = $pink_orb.global_position
	add_child(left_backish)


func _on_pink_orb_left_front() -> void:
	var left_frontish = left_front_leg.instantiate()
	left_frontish.position = $pink_orb.global_position
	add_child(left_frontish)
	

func _on_pink_orb_right_back() -> void:
	var right_backish = right_back_leg.instantiate()
	right_backish.position = $pink_orb.global_position
	add_child(right_backish)
	
func _on_pink_orb_right_front() -> void:
	var right_frontish = right_front_leg.instantiate()
	right_frontish.position = $pink_orb.global_position
	add_child(right_frontish)
	
func _on_pink_orb_2_death() -> void:
	var escaped = entity.instantiate()
	escaped.global_position = $pink_orb2.position
	call_deferred('add_child',escaped)
	
func _on_pink_orb_2_left_back() -> void:
	var left_backish = left_back_leg.instantiate()
	left_backish.position = $pink_orb2.global_position
	add_child(left_backish)


func _on_pink_orb_2_left_front() -> void:
	var left_frontish = left_front_leg.instantiate()
	left_frontish.position = $pink_orb2.global_position
	add_child(left_frontish)
	

func _on_pink_orb_2_right_back() -> void:
	var right_backish = right_back_leg.instantiate()
	right_backish.position = $pink_orb2.global_position
	add_child(right_backish)
	
func _on_pink_orb_2_right_front() -> void:
	var right_frontish = right_front_leg.instantiate()
	right_frontish.position = $pink_orb2.global_position
	add_child(right_frontish)


func _on_pink_orb_drop_rat() -> void:
	var rat = dropped.instantiate()
	rat.position = $pink_orb.global_position
	call_deferred('add_child',rat)
	$pink_orb/pink_orb_one_timer.start()

func _on_pink_orb_one_timer_timeout() -> void:
	var rat = little_rat.instantiate()
	rat.position = $pink_orb/pink_orb_one_rat_drop.global_position
	add_child(rat)

func _on_pink_orb_2_drop_rat() -> void:
	var rat = dropped.instantiate()
	rat.position = $pink_orb2.global_position
	call_deferred('add_child',rat)
	$pink_orb2/pink_orb_two_timer.start()
	

func _on_pink_orb_two_timer_timeout() -> void:
	var rat = little_rat.instantiate()
	rat.position = $pink_orb2/pink_orb_two_rat_drop.global_position
	add_child(rat)
