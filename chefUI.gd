extends Control

# Declare member variables here. Examples:
# var a = 2
var val = 0
var started = false
var doonce = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/MarginContainer.modulate = Color(1,1,1,0)
	$CountDown.start()
func _process(delta):
	var time = str(int($CountDown.time_left)) + "..."
	
	if(!doonce):
		$CanvasLayer/MarginContainer2/list.set_bbcode(time)
	if(int($CountDown.time_left)==0&&!doonce):
		
		$CanvasLayer/MarginContainer2/list.set_bbcode("BEGIN!")
		$timer.start()
		started = true
		$CanvasLayer/MarginContainer.modulate = Color(1,1,1,1)
		doonce = true
	if($timer.time_left==0&&started):
		$CanvasLayer/MarginContainer2/list.set_bbcode("")
		$CanvasLayer/MarginContainer/list.set_bbcode("")