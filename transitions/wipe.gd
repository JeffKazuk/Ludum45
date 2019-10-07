extends Control

# Declare member variables here. Examples:
# var a = 2
export var endAlpha = 1
export var fadeTime = 0
onready var black = get_node("black")
onready var timer = get_node("Timer")
var done = false
var que = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$tim.wait_time = fadeTime
	
	if(endAlpha==0):
		black.scale.y=3
	else:
		black.scale.y=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(endAlpha==1):
		black.scale.y = 3*((1-$tim.time_left)/$tim.wait_time)
	elif(endAlpha==0):
		que = true
		black.scale.y = (($tim.time_left)*3/$tim.wait_time*3)
	if($tim.time_left==0):
		done = true
	if($tim.time_left==0&&done&& que):
		queue_free()