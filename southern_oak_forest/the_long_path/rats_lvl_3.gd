extends Node2D

var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
var farty: PackedScene = preload("res://enemies/Rolly_boy/fart_ring.tscn")
@onready var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
var cured: PackedScene = preload('res://enemies/entity/the_entity.tscn')
@onready var puddle: PackedScene = preload('res://enemies/entity/puddle_of_pink_ooze.tscn')
var counter = 0

func _physics_process(_delta):
	count_rats()
func count_rats():
	if counter == 125:
		pass
#func _on_rolly_boy_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy.position
	#add_child(fart)
	#
#func _on_rolly_boy_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_2_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy2.position
	#add_child(fart)
#
#func _on_rolly_boy_2_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy2.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_3_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy3.position
	#add_child(fart)
#
#func _on_rolly_boy_3_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy3.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_4_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy4.position
	#add_child(fart)
#
#func _on_rolly_boy_4_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy4.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_5_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy5.position
	#add_child(fart)
#
#func _on_rolly_boy_5_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy5.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_6_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy6.position
	#add_child(fart)
#
#func _on_rolly_boy_6_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy6.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_7_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy7.position
	#add_child(fart)
#
#func _on_rolly_boy_7_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy7.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_8_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy8.position
	#add_child(fart)
#
#func _on_rolly_boy_8_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy8.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_9_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy9.position
	#add_child(fart)
#
#func _on_rolly_boy_9_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy9.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_10_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy10.position
	#add_child(fart)
#
#func _on_rolly_boy_10_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy10.position
	#add_child(pink_puddle)
	#
#func _on_rolly_boy_11_fart():
	#var fart = farty.instantiate()
	#fart.global_position = $rolly_boy11.position
	#add_child(fart)
#
#func _on_rolly_boy_11_puddle():
	#var pink_puddle = puddle.instantiate()
	#pink_puddle.global_position = $rolly_boy11.position
	#add_child(pink_puddle)
	

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


func _on_lil_rat_count():
	counter = counter + 1
	print(counter,"=counter")

func _on_mage_counter():
	var curing = cured.instantiate()
	curing.global_position = $mage.position
	add_child(curing)

func _on_mage_2_counter():
	var curing = cured.instantiate()
	curing.global_position = $mage2.position
	add_child(curing)

func _on_mage_3_counter():
	var curing = cured.instantiate()
	curing.global_position = $mage3.position
	add_child(curing)
