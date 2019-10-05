extends Control

export var file = ""
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func get_file():
	return "res://dialogue/" + file + ".json"
	
func set_file(s):
	file = "res://dialogue/" + s + ".json"