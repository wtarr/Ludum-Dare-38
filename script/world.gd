extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area2D_area_enter( area ):
	stage_manager.change_stage("res://scene/dialog_scene.tscn")

func _on_Button_pressed():
	get_node("Button").set_disabled(true)
	get_node("path/follow/boat").should_move()