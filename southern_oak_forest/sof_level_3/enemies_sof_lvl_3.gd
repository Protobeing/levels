extends Node2D
var grubby: PackedScene = preload('res://drops/grub/grub.tscn')
var spell: PackedScene = preload('res://enemies/Wiz_rats/prayer_orb.tscn')
var skull: PackedScene = preload("res://enemies/Wiz_rats/death_cloud.tscn")
var fart: PackedScene = preload('res://enemies/Rolly_boy/fart_ring.tscn')
var puddle: PackedScene = preload('res://enemies/Rolly_boy/puddle_of_pink_ooze.tscn')
var boss_1: PackedScene = preload('res://enemies/groupings/boss_one/boss_one.tscn')
var boss_2: PackedScene = preload('res://enemies/groupings/boss_two/boss_two.tscn')


func _ready() -> void:
	random_bosses()

func _process(_delta: float) -> void:
	pass
func _on_rat_grub() -> void:
	var grub = grubby.instantiate()
	grub.position = $rat.position
	add_child(grub)
func _on_mage_spell()-> void:
	var prayer = spell.instantiate()
	prayer.global_position = $mage.position
	add_child(prayer)
func _on_mage_skull() -> void:
	var skulls = skull.instantiate()
	skulls.global_position = $mage.position
	call_deferred('add_child', skulls)


#func _on_rolly_boy_fart() -> void:
	#var farty = fart.instantiate()
	#farty.position = $rolly_boy.global_position
	#call_deferred('add_child', farty)
#func _on_rolly_boy_2_fart() -> void:
	#var farty = fart.instantiate()
	#farty.position = $rolly_boy2.global_position
	#call_deferred('add_child', farty)
#func _on_rolly_boy_3_fart() -> void:
	#var farty = fart.instantiate()
	#farty.position = $rolly_boy3.global_position
	#call_deferred('add_child', farty)
#func _on_rolly_boy_4_fart() -> void:
	#var farty = fart.instantiate()
	#farty.position = $rolly_boy4.global_position
	#call_deferred('add_child', farty)
#func _on_rolly_boy_5_fart() -> void:
	#var farty = fart.instantiate()
	#farty.position = $rolly_boy5.global_position
	#call_deferred('add_child', farty)
#
#func _on_rolly_boy_puddle() -> void:
	#var puddles = puddle.instantiate()
	#puddles.position = $rolly_boy.global_position
	#call_deferred('add_child', puddles)
#func _on_rolly_boy_2_puddle() -> void:
	#var puddles = puddle.instantiate()
	#puddles.position = $rolly_boy2.global_position
	#call_deferred('add_child', puddles)
#func _on_rolly_boy_3_puddle() -> void:
	#var puddles = puddle.instantiate()
	#puddles.position = $rolly_boy3.global_position
	#call_deferred('add_child', puddles)
#func _on_rolly_boy_4_puddle() -> void:
	#var puddles = puddle.instantiate()
	#puddles.position = $rolly_boy4.global_position
	#call_deferred('add_child', puddles)
#func _on_rolly_boy_5_puddle() -> void:
	#var puddles = puddle.instantiate()
	#puddles.position = $rolly_boy5.global_position
	#call_deferred('add_child', puddles)

func random_bosses():
		randomize()
		var rand_value = randi() % 5 # Generate a random number between 0 and 4
		match rand_value:
			0:
				boss_two()

			1:
				boss_two()
		

			2:
				boss_two()

			3:
				boss_two()
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
	pass
func boss_four():
	pass
func boss_five():
	pass
