extends Node


var fade = preload("res://transitions/fade.tscn")
var ins = fade.instance()
var do = true
export var fadetime = 0
export var fadeA = 0

export var nextLevel = ""
var filepath = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	filepath = "res://Levels/" + nextLevel + ".tscn"
	

func change():
	get_tree().change_scene(filepath)

func spawnFade():
	
	$fadeTimer.set_wait_time(fadetime)
	$fadeTimer.start()
	add_child(ins)
	ins.fadeTime = $fadeTimer.get_wait_time()
	ins.alphaEnd = fadeA

func _process(delta):
	if(ins.val==fadeA):
		change()
