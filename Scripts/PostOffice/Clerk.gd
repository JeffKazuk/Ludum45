extends Spatial

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()

func _ready():
	pass 

func _on_interact():
	#Not started
	if GlobalVars.mail_started == false:
		GlobalVars.mail_started = true
		ins.file = "post1"
		add_child(ins)
	#finished
	elif GlobalVars.mail_started == true && GlobalVars.mail_deliveries.values().count(true) == 5:
		GlobalVars.mail_done = true
		ins.file = "post2"
		add_child(ins)
	#started, not finished
	else:
		ins.file = "postidle"
		add_child(ins)
