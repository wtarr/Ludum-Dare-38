extends TextureFrame

# class member variables go here, for example:
# var a = 2
var r_text

var array = []
var startletter = 0

var currentTime = 0
var complete = false

var text = ""
export var panelSize = Vector2(310, 110)
export var coolDownBetweenCharacters = 0.1
export var shouldPlay = false

var cleanup_triggered = false

signal dialog_complete
signal dialog_removed

func set_position(vect2):
	set_pos(vect2)

func set_text(t):
	text = t
	for l in text:
		array.append(l)

func should_play():
	shouldPlay = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#set_size(panelSize)
	r_text = get_node("r_text")
	set_process(true)

func cleanup(seconds):
	if not cleanup_triggered:
		cleanup_triggered = true
		var timer = Timer.new()
		timer.set_wait_time(seconds)
		timer.connect("timeout", self, "_on_cleanup_timer_timeout")
		add_child(timer)
		timer.start()

func _process(delta):
	if shouldPlay:
		currentTime += delta
	
		if startletter == array.size():
			emit_signal("dialog_complete")
			complete = true
			set_process(false)
		
		if currentTime > coolDownBetweenCharacters and not complete:
			var nextLetter = text[startletter]
			r_text.add_text(nextLetter)
	
			startletter+=1
			currentTime = 0

func _on_cleanup_timer_timeout():
	emit_signal("dialog_removed")
	queue_free()
