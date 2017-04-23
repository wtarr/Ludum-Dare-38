extends CanvasLayer

func _ready():
	#var screen_size = OS.get_screen_size()
	#var window_size = OS.get_window_size()
	#OS.set_window_position(screen_size*0.5 - window_size*0.5)
	pass
	
func change_stage(stage_path):
	# fade out
	get_node("AnimationPlayer").play("fade_in")
	yield(get_node("AnimationPlayer"), "finished")
	
	# change
	get_tree().change_scene(stage_path)
	
	# fade in
	get_node("AnimationPlayer").play("fade_out")
	pass
