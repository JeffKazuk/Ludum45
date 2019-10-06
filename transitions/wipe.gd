extends Control

# Declare member variables here. Examples:
# var a = 2
export var endAlpha = 1
onready var black = get_node("black")
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	if(endAlpha==0):
		black.scale.y=3
	else:
		black.scale.y=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(endAlpha==1):
		black.scale.y = ((1-timer.time_left)*3/timer.wait_time*3)
	elif(endAlpha==0):
		black.scale.y = ((timer.time_left)*3/timer.wait_time*3)