extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dialog = preload("../scene/dialog.tscn")

var d1
var d2
var d3
var d4


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

# DIALOG 1
func _on_stop_point_area_enter( area ):
	if (area.get_name() == 'character'):
		get_node("character").stop_walking()
		get_node("character").start_waving()
		d1 = dialog.instance()
		d1.set_position(Vector2(150, 150))
		d1.connect("dialog_complete", self, "_on_dialog_1_complete")
		d1.connect("dialog_removed", self, "_on_dialog_1_removed")
		d1.set_text("hello there!")		
		add_child(d1)
		d1.should_play();
	pass # replace with function body

func _on_dialog_1_complete():	
	d1.cleanup(1)

# DIALOG 2
func _on_dialog_1_removed():
	d2 = dialog.instance()
	d2.set_position(Vector2(450, 150))
	d2.connect("dialog_complete", self, "_on_dialog_2_complete")
	d2.connect("dialog_removed", self, "_on_dialog_2_removed")
	d2.set_text("oh hello!\n\nwhere did you come from?")	
	add_child(d2)
	d2.should_play();
	get_node("character_2").start_waving()

func _on_dialog_2_complete():
	d2.cleanup(1)

func _on_dialog_2_removed():
	# START DIALOG 3
	d3 = dialog.instance()
	d3.set_position(Vector2(150, 150))
	d3.connect("dialog_complete", self, "_on_dialog_3_complete")
	d3.connect("dialog_removed", self, "_on_dialog_3_removed")
	d3.set_text("oh, just from that tiny island over there!" +
	"\n\nI always wanted to visit but kept putting it off")
	add_child(d3)
	d3.should_play();

func _on_dialog_3_complete():
	d3.cleanup(1)

func _on_dialog_3_removed():
	d4 = dialog.instance()
	d4.set_position(Vector2(450, 150))
	d4.connect("dialog_complete", self, "_on_dialog_4_complete")
	# d4.connect("dialog_removed", self, "_on_dialog_3_removed")
	d4.set_text("oh wow, glad you came" +
	"\n\nwe do live in a small world, come join us for a meal")
	add_child(d4)
	d4.should_play();

func _on_dialog_4_complete():
	d4.cleanup(1)
	stage_manager.change_stage("res://scene/closing_scene.tscn")