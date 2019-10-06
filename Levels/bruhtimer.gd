extends Timer

# Declare member variables here. Examples:

var do = true
# Called when the node enters the scene tree for the first time.

func _process(delta):
	if(time_left==0&&do==true):
		doonce()
		do = false

func doonce():
	get_tree().get_current_scene().get_node("changeScene").spawnFade()
