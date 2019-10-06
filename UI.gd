extends Control

# Declare member variables here. Examples:
# var a = 2
var val = 0
var isdone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	isdone = GlobalVars.isdone()
	if(isdone):
		$CanvasLayer/MarginContainer/list.set_bbcode("*: Go to the bus stop!")
	else:
		$CanvasLayer/MarginContainer/list.set_bbcode("*: Catch up with old friends")
func _process(delta):
	$CanvasLayer/MarginContainer.modulate = Color(1,1,1,1-$timer.time_left/$timer.wait_time)