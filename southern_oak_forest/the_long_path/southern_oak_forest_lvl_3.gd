extends Node2D
class_name SOF3
var not_cured: bool = true
@onready var JED = $Board/Jed
var leaving = false
@onready var Open_up = $Board/Dummy/Open
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
var wiz_rat_counter_lvl_3: int = 0
@onready var altar = $center_of_worship
@onready var bye_bye = $bye
func _ready():
		JED.position = Vector2(899,761)
		if Global.chick_counter >= 1:
			var chick_1 = chick.instantiate()
			chick_1.position = $chick_positions/Chick_one_from_lvl_2.position
			add_child(chick_1)
		if Global.chick_counter >= 2:
			var chick_2 = chick.instantiate()
			chick_2.global_position = $chick_positions/Chick_two_from_lvl_2.position
			add_child(chick_2)
		if Global.chick_counter >= 3:
			var chick_3 = chick.instantiate()
			chick_3.global_position = $chick_positions/Chick_three_from_lvl_2.position
			add_child(chick_3)
		if Global.chick_counter >= 4:
			var chick_4 = chick.instantiate()
			chick_4.global_position = $chick_positions/Chick_four_from_lvl_2.position
			add_child(chick_4)
		if Global.chick_counter >= 5:
			var chick_5 = chick.instantiate()
			chick_5.global_position = $chick_positions/Chick_five_from_lvl_2.position
			add_child(chick_5)
		
	#print(PlayerData.tunnel_one, '= tunnel_one')
	#if PlayerData.from_lvl_2:
		#if PlayerData.tunnel_two_open ==false:
			#JED.position = Vector2(846,703)
			#print(position, 'from lvl 2')
		#if PlayerData.tunnel_two_open:
			#JED.position = Vector2(846,703)
			#print(position, 'from lvl 2')
			#Open_up.play("open_tunnel")
	#if PlayerData.from_lvl_2 == false:
		#print(PlayerData.tunnel_one, '= tunnel_one')
	
	#if PlayerData.tunnel_one == true and PlayerData.from_lvl_2 == false:
		#Open_up.play("open_tunnel")
		#JED.position = $Board/Dummy/exit_tunnel_to_lvl_two.global_position
		#print('did_it')
		#if Global.chick_counter >= 1:
			#var chick_1 = chick.instantiate()
			#chick_1.position = $chick_positions/Chick_one.position
			#add_child(chick_1)
		#if Global.chick_counter >= 2:
			#var chick_2 = chick.instantiate()
			#chick_2.global_position = $chick_positions/Chick_two.position
			#add_child(chick_2)
		#if Global.chick_counter >= 3:
			#var chick_3 = chick.instantiate()
			#chick_3.global_position = $chick_positions/Chick_three.position
			#add_child(chick_3)
		#if Global.chick_counter >= 4:
			#var chick_4 = chick.instantiate()
			#chick_4.global_position = $chick_positions/Chick_four.position
			#add_child(chick_4)
		#if Global.chick_counter >= 5:
			#var chick_5 = chick.instantiate()
			#chick_5.global_position = $chick_positions/Chick_five.position
			#add_child(chick_5)
	#if PlayerData.from_lvl_2:
		#JED.position = Vector2(899,761)
		#if Global.chick_counter >= 1:
			#var chick_1 = chick.instantiate()
			#chick_1.position = $chick_positions/Chick_one_from_lvl_2.position
			#add_child(chick_1)
		#if Global.chick_counter >= 2:
			#var chick_2 = chick.instantiate()
			#chick_2.global_position = $chick_positions/Chick_two_from_lvl_2.position
			#add_child(chick_2)
		#if Global.chick_counter >= 3:
			#var chick_3 = chick.instantiate()
			#chick_3.global_position = $chick_positions/Chick_three_from_lvl_2.position
			#add_child(chick_3)
		#if Global.chick_counter >= 4:
			#var chick_4 = chick.instantiate()
			#chick_4.global_position = $chick_positions/Chick_four_from_lvl_2.position
			#add_child(chick_4)
		#if Global.chick_counter >= 5:
			#var chick_5 = chick.instantiate()
			#chick_5.global_position = $chick_positions/Chick_five_from_lvl_2.position
			#add_child(chick_5)
	#PlayerData.from_death = false
	#PlayerData.in_tunnel = false
	#PlayerData.from_coop = false
	#PlayerData.from_lvl_1 = false
	#PlayerData.from_lvl_2 = false
	#PlayerData.from_lvl_3 = false
func _process(_delta):
	#if wiz_rat_counter_lvl_3 >= 3 and not_cured:
		#bye_bye.play("new_animation")
		#not_cured = false
		pass
func bye_altar():
	altar.queue_free()

func _on_area_2d_body_entered(body): # entrance to NOF
	if body is Player:
		#leaving = true
		PlayerData.from_lvl_3 = true
		get_tree().change_scene_to_file('res://levels/Oak_forest/bridge_sof_to_nof.tscn')



func _on_entrance_to_tunnel_two_body_entered(body):
	if body is Player:
		PlayerData.from_lvl_3 = true
		get_tree().change_scene_to_file('res://levels/Oak_forest/Earth/tunnel_one/tunnel_one.tscn')





func _on_to_lvl_2_body_entered(body):
	if body is Player:
		PlayerData.from_lvl_3 = true
		get_tree().change_scene_to_file('res://levels/Oak_forest/southern_oak_forest_level_2.tscn')


func _on_the_gate_body_entered(body):
	if body is Entity:
		wiz_rat_counter_lvl_3 = wiz_rat_counter_lvl_3 + 1
		print('wiz_rat_counter =', wiz_rat_counter_lvl_3)
