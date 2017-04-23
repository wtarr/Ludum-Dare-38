extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 50
var velocity = Vector2()
onready var anim = get_node("AnimatedSprite")
export var should_walk = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	anim.play("walk")
	pass
	
func _process(delta):
	if should_walk:
		velocity = Vector2(1, 0).normalized() * speed
		var pos = get_pos() + velocity * delta
		set_pos(pos)

func stop_walking():
	should_walk = false
	anim.stop()

func start_waving():
	anim.play("wave")
