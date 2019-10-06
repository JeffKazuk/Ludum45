extends Timer

# Declare member variables here. Examples:
var scene = preload("res://dialogue/Dialogue.tscn")
var ins = scene.instance()
var do = true
# Called when the node enters the scene tree for the first time.

func _process(delta):
	if(time_left==0&&do==true):
		doonce()
		do = false

func doonce():
	ins.file = "guard"
	add_child(ins)

	