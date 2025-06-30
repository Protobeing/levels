extends Node2D
@onready var gate_anim_two = $gate_block_west/AnimationPlayer
@onready var gate_anim_one = $gate_block_north/AnimationPlayer
@onready var gate_anim_three = $gate_block_north2/AnimationPlayer
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
@onready var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
@onready var farty: PackedScene = preload("res://enemies/Rolly_boy/fart_ring.tscn")
@onready var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
@onready var cured: PackedScene = preload('res://enemies/entity/the_entity.tscn')
@onready var puddle: PackedScene = preload('res://enemies/entity/puddle_of_pink_ooze.tscn')
var counter = 0

func _physics_process(_delta):
	pass
func count_rats():
	if counter == 125:
		pass
#func _on_rolly_boy_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy.position
	#add_child(fart)
	#
func _on_rolly_boy_fart() -> void:
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy.position
	add_child(fart)
func _on_rolly_boy_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy.position
	add_child(pink_puddle)
	
func _on_rolly_boy_2_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy2.position
	add_child(fart)

func _on_rolly_boy_2_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy2.position
	add_child(pink_puddle)
	
func _on_rolly_boy_3_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy3.position
	add_child(fart)

func _on_rolly_boy_3_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy3.position
	add_child(pink_puddle)
	
func _on_rolly_boy_4_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy4.position
	add_child(fart)

func _on_rolly_boy_4_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy4.position
	add_child(pink_puddle)
	
func _on_rolly_boy_5_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy5.position
	add_child(fart)

func _on_rolly_boy_5_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy5.position
	add_child(pink_puddle)
	
func _on_rolly_boy_6_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy6.position
	add_child(fart)

func _on_rolly_boy_6_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy6.position
	add_child(pink_puddle)
	
func _on_rolly_boy_7_fart():
	var fart = farty.instantiate()
	fart.global_position = $rolly_boy7.position
	add_child(fart)

func _on_rolly_boy_7_puddle():
	var pink_puddle = puddle.instantiate()
	pink_puddle.global_position = $rolly_boy7.position
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
	var curing = cured.instantiate()
	curing.global_position = $mage.position
	add_child(curing)
	gate_anim_three.play('escaped')

func _on_mage_2_counter():
	var curing = cured.instantiate()
	curing.global_position = $mage2.position
	add_child(curing)
	gate_anim_one.play("escaped")
func _on_mage_3_counter():
	var curing = cured.instantiate()
	curing.global_position = $mage3.position
	add_child(curing)


func _on_rolly_boy_count() -> void:
	counter = counter +1
	if counter >= 1:
		gate_anim_two.play("player_wins")
		$chicks/feather_drop.play("feather_drop")
func _on_rolly_boy_2_count() -> void:
	counter = counter +1
	if counter >= 3:
		gate_anim_two.play("player_wins")
		$chicks/feather_drop.play("feather_drop")

func _on_rolly_boy_3_count() -> void:
	counter = counter +1
	if counter >= 3:
		gate_anim_two.play("player_wins")
		$chicks/feather_drop.play("feather_drop")

func _on_rolly_boy_4_count() -> void:
	pass # Replace with function body.


func _on_rolly_boy_5_count() -> void:
	pass # Replace with function body.


func _on_rolly_boy_6_count() -> void:
	pass # Replace with function body.


func _on_rolly_boy_7_count() -> void:
	pass # Replace with function body.


func _on_blue_flowers_chick() -> void:
		#if BlueFlowerCount.blue_flower_1 == false:
	Global.chick_counter = Global.chick_counter + 1
	print(Global.chick_counter, "= Global chick counter")
		#BlueFlowerCount.blue_flower_1 = true
	if Global.chick_counter <= 5:
			var chicky = chick.instantiate()
			chicky.global_position = $chicks/Blue_flowers.position
			add_child(chicky)
