extends Node2D
class_name SOF3
var rats = preload('res://levels/southern_oak_forest/the_long_path/rats_lvl_3.tscn')
var the_leftovers = preload('res://levels/southern_oak_forest/the_long_path/rats_of_level_three_leftovers.tscn')
var count = 0
var not_cured: bool = true
@onready var JED = $Board/Jed
var leaving = false
#@onready var Open_up = $Board/Dummy/Open
var chick: PackedScene = preload("res://ghost_babies_and_blue_flowers/ghost_babies.tscn")
var wiz_rat_counter_lvl_3: int = 0
@onready var altar = $center_of_worship
@onready var bye_bye = $bye
func _ready():
	if Levels.rats_of_level_three_are_wiped == false:
		var rat = rats.instantiate()
		rat.global_position = $Board.position
		call_deferred('add_child',rat)
	if Levels.rats_of_level_three_are_wiped:
		
		$center_of_worship.queue_free()
		var whats_left = the_leftovers.instantiate()
		whats_left.global_position = $Board.position
		call_deferred('add_child',whats_left)
	if Levels.from_entrance_to_the_long_path:
		Levels.from_entrance_to_the_long_path = false
		Levels.under_great_tree = false
		Global.blue_flower_heal = true
		AudioPlayer.stop_all()
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
	if Levels.under_great_tree:
		Levels.under_great_tree = false
		JED.position = Vector2(3,29)
		Levels.from_entrance_to_the_long_path = false
		Global.blue_flower_heal = true
		AudioPlayer.stop_all()
		if Global.chick_counter >= 1:
			var chick_1 = chick.instantiate()
			chick_1.position = $chick_positions/Chick_one.position
			add_child(chick_1)
		if Global.chick_counter >= 2:
			var chick_2 = chick.instantiate()
			chick_2.global_position = $chick_positions/Chick_two.position
			add_child(chick_2)
		if Global.chick_counter >= 3:
			var chick_3 = chick.instantiate()
			chick_3.global_position = $chick_positions/Chick_three.position
			add_child(chick_3)
		if Global.chick_counter >= 4:
			var chick_4 = chick.instantiate()
			chick_4.global_position = $chick_positions/Chick_four.position
			add_child(chick_4)
		if Global.chick_counter >= 5:
			var chick_5 = chick.instantiate()
			chick_5.global_position = $chick_positions/Chick_five.position
			add_child(chick_5)
	else:
		JED.position = Vector2(899,761)
func _process(_delta):
	if count >= 3:
		Levels.rats_of_level_three_are_wiped = true
		if not_cured:
			not_cured = false
			bye_bye.play("new_animation")
func bye_altar():
	altar.queue_free()

func _on_area_2d_body_entered(body): # entrance to NOF
	if body is Player:
		#leaving = true
		PlayerData.from_lvl_3 = true
		get_tree().call_deferred('change_scene_to_file','res://levels/the_end_and_the_beginning/twilights_edge.tscn')



func _on_entrance_to_tunnel_two_body_entered(body):
	if body is Player:
		PlayerData.from_lvl_3 = true
		get_tree().change_scene_to_file('res://levels/Oak_forest/Earth/tunnel_one/tunnel_one.tscn')





func _on_to_lvl_2_body_entered(body):
	if body is Player:
		PlayerData.from_lvl_3 = true
		get_tree().call_deferred('change_scene_to_file','res://levels/entrance_big_ol_rat/final_gate.tscn')


func _on_the_gate_body_entered(body):
	if body is Entity:
		wiz_rat_counter_lvl_3 = wiz_rat_counter_lvl_3 + 1
		print('wiz_rat_counter =', wiz_rat_counter_lvl_3)


func _on_great_oak_two_change() -> void:
	print('really under great oak')
	get_tree().call_deferred('change_scene_to_file','res://trees/oaks/Great_oak/inside_great_oak.tscn')


func _on_escape_path_body_entered(body: Node2D) -> void:
		count += 1


func _on_blue_flowers_chick() -> void:
	pass # Replace with function body.
