extends Control

# Declare member variables here. Examples:
# var a = 2
onready var black = get_node("black")
onready var timer = get_node("Timer")
export var fadeTime = 0
export var alphaEnd = 1
var val = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = fadeTime
	timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(alphaEnd == 0):
		val = timer.time_left/timer.wait_time
	else:
		val = 1-timer.time_left/timer.wait_time
	var color = Color(0,0,0,(val))
	black.set_color(color)


func _on_Timer_timeout():
	pass # Replace with function body.
