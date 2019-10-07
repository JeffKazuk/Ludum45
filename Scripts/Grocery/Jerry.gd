extends Spatial

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()

func _ready():
	pass 

func _on_interact():
	#First TIme
	if GlobalVars.grocery_attempted == false:
		GlobalVars.grocery_attempted = true
		ins.file = "grocer2"
		add_child(ins)
	#Rematch
	elif GlobalVars.grocery_attempted == true && GlobalVars.grocery_done == false:
		GlobalVars.mail_done = true
		ins.file = "grocerrematch"
		add_child(ins)
