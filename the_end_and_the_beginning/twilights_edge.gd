extends Node2D
var slime_south: PackedScene = preload("res://levels/the_end_and_the_beginning/Big_ol_rat/pipe_attacks/pipe_slime.tscn")
var slime_east: PackedScene = preload("res://levels/the_end_and_the_beginning/Big_ol_rat/pipe_attacks/pipe_slime_east.tscn")
var rats: PackedScene = preload("res://levels/the_end_and_the_beginning/Big_ol_rat/hidden_rats/rats_in_a_basket_one.tscn")
var pink_smoke:PackedScene = preload("res://enemies/Wiz_rats/prayer_orb.tscn")
var pray = preload("res://enemies/Wiz_rats/prayer_orb.tscn")
var rolly_ = preload("res://enemies/Rolly_boy/rolly_boy.tscn")
var steps: PackedScene = preload("res://jed_main/ready/foot_prints.tscn")
var stomp: PackedScene = preload("res://jed_main/stomp/stomp.tscn")
var rocks: PackedScene = preload("res://jed_main/rocks/throwing_rock.tscn")
var flame: PackedScene = preload("res://jed_main/flame_dash/fire.tscn")
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
var pickup_rocks: PackedScene = preload("res://jed_main/rocks/rocks.tscn")
var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
var blue_healing: PackedScene = preload("res://numbers/blue_fire/blue_heal.tscn")
@onready var anim = $AnimationPlayer
#@onready var Effects = $fight_effects
@onready var dropped: PackedScene = preload('res://enemies/entity/drop_rat.tscn')
@onready var little_rat:PackedScene = preload('res://enemies/lil_rat_1/lil_rat.tscn')
#pink orb's "legs"
@onready var right_front_leg: PackedScene = preload("res://enemies/entity/rightish_leg_front.tscn")
@onready var left_front_leg: PackedScene = preload("res://enemies/entity/leftish_leg_front.tscn")
@onready var right_back_leg: PackedScene = preload("res://enemies/entity/rightish_leg_back.tscn")
@onready var left_back_leg: PackedScene = preload("res://enemies/entity/leftish_leg_back.tscn")
@onready var Splatter_one =$pink_orb
@onready var Splatter_two = $pink_orb2

var entity: PackedScene = preload("res://enemies/entity/the_entity.tscn")
var death_count = 0

func _ready():
	
	if Global.gate_seven == false:
		Global.gate_counter += 1
		Global.gate_seven = true
	$Jed.position = Vector2(425,604)
	if Global.chick_counter >= 1:
			var chick_1 = chick.instantiate()
			chick_1.position = $chick_spawns/chick_spawn.position
			add_child(chick_1)
	if Global.chick_counter >= 2:
			var chick_2 = chick.instantiate()
			chick_2.global_position = $chick_spawns/chick_spawn2.position
			add_child(chick_2)
	if Global.chick_counter >= 3:
			var chick_3 = chick.instantiate()
			chick_3.global_position = $chick_spawns/chick_spawn3.position
			add_child(chick_3)
	if Global.chick_counter >= 4:
			var chick_4 = chick.instantiate()
			chick_4.global_position = $chick_spawns/chick_spawn4.position
			add_child(chick_4)
	if Global.chick_counter >= 5:
			var chick_5 = chick.instantiate()
			chick_5.global_position = $chick_spawns/chick_spawn5.position
			add_child(chick_5)

func _on_jed_step():
	var step = steps.instantiate()
	step.global_position = $Jed.position
	add_child(step)
func _on_jed_stomp():
	var stomp_cloud = stomp.instantiate()
	stomp_cloud.position = $Jed.position
	add_child(stomp_cloud)
func _on_jed_rocks_e(pos, direction):
	var rock = rocks.instantiate() as RigidBody2D
	rock.position = pos
	rock.rotation = direction
	add_child(rock)
	await get_tree().create_timer(1).timeout
	var pickup_rock = pickup_rocks.instantiate()
	pickup_rock.global_position = rock.position
	add_child(pickup_rock)
	rock.queue_free()
func _on_jed_flame():
	var flames = flame.instantiate()
	flames.global_position = $Jed.position
	add_child(flames)

func _on_big_ol_rat_pipe_slime_e():
	var slimed_east = slime_east.instantiate()
	slimed_east.position = $Big_ol_rat/pipe_slime_east.global_position
	add_child(slimed_east)
func _on_big_ol_rat_pipe_slime_s():
	var slimed_south = slime_south.instantiate()
	slimed_south.position = $Big_ol_rat/pipe_slime_south.global_position
	add_child(slimed_south)

func _on_hidden_rats_one_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_two_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one2/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_three_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one3/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_four_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one4/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_five_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one5/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_six_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one6/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_seven_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one7/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_eight_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one8/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_nine_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one9/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_ten_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one10/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_eleven_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one11/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_twelve_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one12/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_thirteen_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one13/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)
func _on_hidden_rats_fourteen_timer_timeout():
	var hidden_rat_attack_one = rats.instantiate()
	hidden_rat_attack_one.position = $rats_in_a_basket_one14/fern_collection_two.global_position
	add_child(hidden_rat_attack_one)

func _on_big_ol_rat_belch_1():
	var belch = pink_smoke.instantiate()
	belch.global_position = $Big_ol_rat/belch.position
	add_child(belch)
func _on_big_ol_rat_belch_2():
	var belch = pink_smoke.instantiate()
	belch.global_position = $Big_ol_rat/belch2.position
	add_child(belch)
func _on_big_ol_rat_belch_3():
	var belch = pink_smoke.instantiate()
	belch.global_position = $Big_ol_rat/belch3.position
	add_child(belch)
func _on_big_ol_rat_belch_4():
	var belch = pink_smoke.instantiate()
	belch.global_position = $Big_ol_rat/belch4.position
	add_child(belch)
func _on_big_ol_rat_belch_5():
	var belch = pink_smoke.instantiate()
	belch.global_position = $Big_ol_rat/belch5.position
	add_child(belch)
func _on_big_ol_rat_belch_6():
	var belch = pink_smoke.instantiate()
	belch.global_position = $Big_ol_rat/belch6.position
	add_child(belch)

func _on_big_ol_rat_rat():
	var prayer = pray.instantiate()
	prayer.global_position = $Big_ol_rat.position
	add_child(prayer)

func _on_big_ol_rat_rolly():
	var roll = rolly_.instantiate()
	roll.global_position = $Big_ol_rat.position
	add_child(roll)

func _on_blue_flowers_chick():
	var chicky = chick.instantiate()
	chicky.global_position = $Blue_flowers.position
	add_child(chicky)
func _on_blue_flowers_2_chick():
	var chicky = chick.instantiate()
	chicky.global_position = $Blue_flowers2.position
	add_child(chicky)
func _on_blue_flowers_3_chick():
	var chicky = chick.instantiate()
	chicky.global_position = $Blue_flowers3.position
	add_child(chicky)
func _on_blue_flowers_4_chick():
	var chicky = chick.instantiate()
	chicky.global_position = $Blue_flowers4.position
	add_child(chicky)
func _on_blue_flowers_5_chick():
	var chicky = chick.instantiate()
	chicky.global_position = $Blue_flowers5.position
	add_child(chicky)
func _on_blue_flowers_6_chick():
	var chicky = chick.instantiate()
	chicky.global_position = $Blue_flowers.position
	add_child(chicky)
func _on_blue_flowers_7_chick():
	var chicky = chick.instantiate()
	chicky.global_position = $Blue_flowers.position
	add_child(chicky)
	
func _on_mage_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage.position
	call_deferred('add_child', skulls)
func _on_mage_4_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage4.position
	call_deferred('add_child', skulls)
func _on_mage_2_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage2.position
	call_deferred('add_child', skulls)
func _on_mage_3_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage3.position
	call_deferred('add_child', skulls)
func _on_mage_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage.position
	add_child(prayer)
func _on_mage_2_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage2.position
	add_child(prayer)
func _on_mage_3_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage3.position
	add_child(prayer)
func _on_mage_4_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage4.position
	add_child(prayer)
func _on_mage_counter() -> void:
	Levels.escaping = true
	var escape = entity.instantiate()
	escape.global_position = $mage.position
	call_deferred('add_child',escape)
func _on_mage_2_counter() -> void:
	Levels.escaping = true
	var escape = entity.instantiate()
	escape.global_position = $mage2.position
	call_deferred('add_child',escape)
func _on_mage_3_counter() -> void:
	Levels.escaping = true
	var escape = entity.instantiate()
	escape.global_position = $mage3.position
	call_deferred('add_child',escape)
func _on_mage_4_counter() -> void:
	Levels.escaping = true
	var escape = entity.instantiate()
	escape.global_position = $mage4.position
	call_deferred('add_child',escape)

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


func _on_pink_orb_death() -> void:
		death_count += 1
		Levels.escaping = true
		var escape = entity.instantiate()
		escape.global_position = $pink_orb.position
		call_deferred('add_child',escape)


func _on_pink_orb_2_death() -> void:
		death_count += 1
		Levels.escaping = true
		var escape = entity.instantiate()
		escape.global_position = $pink_orb2.position
		call_deferred('add_child',escape)


func _on_pink_orb_3_death() -> void:
		death_count += 1
		Levels.escaping = true
		var esc = entity.instantiate()
		esc.global_position = $pink_orb3.position
		call_deferred('add_child',escape)


func _on_pink_orb_3_drop_rat() -> void:
	var rat = dropped.instantiate()
	rat.position = $pink_orb3.global_position
	call_deferred('add_child',rat)
	$pink_orb3/pink_orb_three_timer.start()


func _on_pink_orb_3_left_back() -> void:
	var left_backish = left_back_leg.instantiate()
	left_backish.position = $pink_orb3.global_position
	add_child(left_backish)


func _on_pink_orb_3_left_front() -> void:
	var left_frontish = left_front_leg.instantiate()
	left_frontish.position = $pink_orb3.global_position
	add_child(left_frontish)


func _on_pink_orb_3_right_back() -> void:
	var right_backish = right_back_leg.instantiate()
	right_backish.position = $pink_orb3.global_position
	add_child(right_backish)


func _on_pink_orb_3_right_front() -> void:
	var right_frontish = right_front_leg.instantiate()
	right_frontish.position = $pink_orb3.global_position
	add_child(right_frontish)


func _on_pink_orb_three_timer_timeout() -> void:
	var rat = little_rat.instantiate()
	rat.position = $pink_orb3/pink_orb_three_rat_drop.global_position
	add_child(rat)


func _on_jed_died() -> void:
	PlayerData.death_in_twilights_edge = true
func _on_jed_blue_healed() -> void:
			var blue_heals = blue_healing.instantiate() 
			blue_heals.global_position  = $Jed.global_position
			add_child(blue_heals)
