extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var dialog = preload("../scene/dialog.tscn")
var timer

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	timer = Timer.new()
	timer.set_wait_time(1)
	timer.connect("timeout", self, "_on_timeout")
	add_child(timer)
	timer.start()
	
func _on_timeout():
	timer.stop()
	var d1 = dialog.instance()
	d1.set_size(Vector2(350, 150))
	d1.set_position(Vector2(150, 150))
	#d1.connect("dialog_complete", self, "_on_dialog_1_complete")
	#d1.connect("dialog_removed", self, "_on_dialog_1_removed")		
	d1.set_text("We really do live in a small world, we should look out for each other" + 
	"\n\nThank you for playing my game" +
	"\n\nplease leave comment so I can play your game" +
	"\n\nHappy 15th Anniversary Ludum Dare")
	add_child(d1)
	d1.should_play();

