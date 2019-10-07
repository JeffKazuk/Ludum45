extends Spatial

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()
var produce = {1 : "Corn", 2 : "Tomatoes", 3 : "Apples", 4 : "Bananas", 5 : "Oranges"}
var currently_holding = ""
var wants = ""
var score = 0
var goal = 15

func _ready():
	randomize()
	score = 0
	new_want()

func new_want():
	wants = produce[randi()%5+1]
	print(wants)

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
		ins.file = "grocer2"
		add_child(ins)
		$changeScene.nextLevel = "Town"
		$changeScene.location = "GroceryStore"
		$Control.free()
		
		
