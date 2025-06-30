extends Node2D

var escaped = false
var fart: PackedScene = preload('res://enemies/Rolly_boy/fart_ring.tscn')
var puddle: PackedScene = preload('res://enemies/Rolly_boy/puddle_of_pink_ooze.tscn')
var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
var boss_1: PackedScene = preload('res://enemies/groupings/boss_one/boss_one.tscn')
var boss_2: PackedScene = preload('res://enemies/groupings/boss_two/boss_two.tscn')
var boss_3: PackedScene = preload('res://enemies/groupings/boss_three/boss_three.tscn')
var boss_4: PackedScene = preload('res://enemies/groupings/boss_four/boss_four.tscn')
var rat_puddle: PackedScene = preload("res://enemies/Rat_Puddle_Factory/rat_puddle_factory.tscn")
func _ready() -> void:
	if Levels.time_to_hunt == false:
		var rat = rat_puddle.instantiate()
		rat.global_position = $".".position
		add_child(rat)
	pass
func _process(_delta: float) -> void:
	#if Levels.escape:
		#if escaped == false:
			#$escape.play("escape")
			#escaped = true
#func delete_gate_block():
	#gate.queue_free()
	pass
func _on_rolly_boy_fart() -> void:
	var farty = fart.instantiate()
	farty.position = $rolly_boy.global_position
	call_deferred('add_child', farty)
func _on_rolly_boy_2_fart() -> void:
	var farty = fart.instantiate()
	farty.position = $rolly_boy2.global_position
	call_deferred('add_child', farty)
#func _on_rolly_boy_3_fart() -> void:
	#var farty = fart.instantiate()
	#farty.position = $rolly_boy3.global_position
	#call_deferred('add_child', farty)
#func _on_rolly_boy_4_fart() -> void:
	#var farty = fart.instantiate()
	#farty.position = $rolly_boy4.global_position
	#call_deferred('add_child', farty)


func _on_rolly_boy_puddle() -> void:
	var puddles = puddle.instantiate()
	puddles.position = $rolly_boy.global_position
	call_deferred('add_child', puddles)
func _on_rolly_boy_2_puddle() -> void:
	var puddles = puddle.instantiate()
	puddles.position = $rolly_boy2.global_position
	call_deferred('add_child', puddles)
#func _on_rolly_boy_3_puddle() -> void:
	#var puddles = puddle.instantiate()
	#puddles.position = $rolly_boy3.global_position
	#call_deferred('add_child', puddles)
#func _on_rolly_boy_4_puddle() -> void:
	#var puddles = puddle.instantiate()
	#puddles.position = $rolly_boy4.global_position
	#call_deferred('add_child', puddles)
func _on_mage_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage.position
	add_child(prayer)
func _on_mage_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage.position
	call_deferred('add_child', skulls)
#func random_bosses():
		#randomize()
		#var rand_value = randi() % 5 # Generate a random number between 0 and 4
		#match rand_value:
			#0:
				#boss_four()
#
			#1:
				#boss_one()
		#
#
			#2:
				#boss_four()
#
			#3:
				#boss_three()
			#4:
				#boss_two()
			##5:
##
			##6:
##
			##7:
##
			##8:
##
			##9:
#func boss_one():
	#var boss = boss_1.instantiate()
	#boss.position = $boss_marker.global_position
	#call_deferred('add_child',boss)
#func boss_two():
	#var boss = boss_2.instantiate()
	#boss.position = $boss_marker.global_position
	#call_deferred('add_child',boss)
#func boss_three():
	#var boss = boss_3.instantiate()
	#boss.position = $boss_marker.global_position
	#call_deferred('add_child',boss)
#func boss_four():
	#var boss = boss_4.instantiate()
	#boss.position = $boss_marker.global_position
	#call_deferred('add_child',boss)
#func boss_five():
	#pass
