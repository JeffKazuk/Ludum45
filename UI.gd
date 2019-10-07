extends Control

# Declare member variables here. Examples:
# var a = 2
var val = 0
var isdone = false
var list = {0:"-Visit the Post-Office",1:"-Visit the Grocery Store",2:"-Visit the Chef Shack",3:"-Visit the Kid",4:"-Visit the Jogger"}
var todo = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	checkDone()
	for x in list.keys():
		todo += list[x]+"\n"
		if(list.size()==5):
			$CanvasLayer/MarginContainer.margin_top -= 25
		if(list.size()==4):
			$CanvasLayer/MarginContainer.margin_top -= 25*2
		if(list.size()==3):
			$CanvasLayer/MarginContainer.margin_top -= 25*3
		if(list.size()==2):
			$CanvasLayer/MarginContainer.margin_top -= 25*4
		if(list.size()==1):
			$CanvasLayer/MarginContainer.margin_top -= 25*5
	isdone = GlobalVars.isdone()
	if(isdone):
		$CanvasLayer/MarginContainer/list.set_bbcode("-Go to the bus stop!")
	else:
		$CanvasLayer/MarginContainer/list.set_bbcode(todo)
func _process(delta):
	GlobalVars.todo()
	
	$CanvasLayer/MarginContainer.modulate = Color(1,1,1,1-$timer.time_left/$timer.wait_time)

func checkDone():
	if(GlobalVars.pop_fly_done):
		list.erase(3)

func hide():
	rect_scale = Vector2(0,0) 
	$CanvasLayer/MarginContainer.rect_scale = Vector2(0,0)
func unhide():
	rect_scale = Vector2(1,1) 
	$CanvasLayer/MarginContainer.rect_scale = Vector2(1,1)


