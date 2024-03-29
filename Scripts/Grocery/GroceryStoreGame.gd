extends Spatial

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()
var produce = {1 : "Corn", 2 : "Tomatoes", 3 : "Apples", 4 : "Bananas", 5 : "Oranges"}
var sprites = {"Corn" : 0,"Tomatoes" : 1 ,"Apples" : 2,"Bananas" : 3,"Oranges" : 4}
var currently_holding = ""
var wants = ""
var score = 0
var goal = 10

func _ready():
	randomize()
	GlobalVars.grocery_attempted = true
	score = 0
	new_want()

func new_want():
	wants = produce[randi()%5+1]
	$Wants.frame = sprites[wants]

func get_time_left():
	return $Timer.time_left

func get_currently_holding():
	return currently_holding

func hand_in():
	if currently_holding == wants:
		score += 1
		print(score)
		currently_holding = ""
		new_want()

func _on_Timer_timeout():
	if score < goal:
		#Lose
		$changeScene.nextLevel = "GroceryStore"
		$changeScene.location = "GameLost"
		ins.file = "grocerlose"
		add_child(ins)
		$Control.free()
	elif score>= goal:
		#Win
		GlobalVars.grocery_done = true
		ins.file = "grocer1"
		add_child(ins)
		$changeScene.nextLevel = "Town"
		$changeScene.location = "GroceryStore"
		$Control.free()
		
		
