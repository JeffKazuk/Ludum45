extends Control

# Declare member variables here. Examples:
# var a = 2
var val = 0
var started = false
var doonce = false
var holding = ""
var sprites = {"Plate" : 0,"Bun" : 5, "Raw_Burger" : 1, "Burger_Cooked" : 2, "Tomato" : 3, "Ketchup" : 4}
var burgers = 0
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
		startGame()
		#started = true

func burger_made():
	burgers += 1
	if burgers <= 5:
		get_node("CanvasLayer/MarginContainer/Sprite"+str(burgers)).visible = true

func startGame():
	$CanvasLayer/MarginContainer2/list.set_bbcode("") # big boy
	$CanvasLayer/MarginContainer/list.set_bbcode(str(int(get_tree().get_current_scene().get_time_left())))
	holding = get_tree().get_current_scene().get_currently_holding()
	if holding:
		get_node("CanvasLayer/MarginContainer/AnimatedSprite").animation = "sprites"
		get_node("CanvasLayer/MarginContainer/AnimatedSprite").frame = sprites[holding]
	else:
		get_node("CanvasLayer/MarginContainer/AnimatedSprite").animation = "empty"
	 #feed timer to dis bad boy small boy
	
	