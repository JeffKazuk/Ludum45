extends Node

export var nextLevel = ""
var filepath = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	filepath = "res://Levels/" + nextLevel + ".tscn"
	

func change():
	get_tree().change_scene(filepath)
