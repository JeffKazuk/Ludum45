extends Control

# Declare member variables here. Examples:
# var a = 2
var val = 0
var isdone = false
var list = {0:"-Visit the Post-Office",1:"-Visit the Grocery Store",2:"-Visit the Chef Shack",3:"-Visit the Kid",4:"-Visit the Jogger"}
var todo = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(list.size()-2):
		todo += list[x]+"\n"
		if(list.size()==5):
			$CanvasLayer/Polygon2D.scale.y -= -0.425*list.size()
			$CanvasLayer/MarginContainer.margin_top -= 25
		if(list.size()==4):
			$CanvasLayer/Polygon2D.scale.y = -0.425*list.size()
			$CanvasLayer/MarginContainer.margin_top -= 25*2
		if(list.size()==3):
			$CanvasLayer/Polygon2D.scale.y -= -0.425
			$CanvasLayer/MarginContainer.margin_top -= 25*3
	isdone = GlobalVars.isdone()
	if(isdone):
		$CanvasLayer/MarginContainer/list.set_bbcode("-Go to the bus stop!")
	else:
		$CanvasLayer/MarginContainer/list.set_bbcode(todo)
func _process(delta):
	$CanvasLayer/MarginContainer.modulate = Color(1,1,1,1-$timer.time_left/$timer.wait_time)