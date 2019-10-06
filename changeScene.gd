extends Node


var fade = preload("res://transitions/fade.tscn")
var ins = fade.instance()
var do = true
var last_loc
export var fadetime = 0
export var fadeA = 0
var faded = false

export var nextLevel = ""
var filepath = ""
func _ready():
	filepath = "res://Levels/" + nextLevel + ".tscn"
	

func change():
	#How Shane did it
	#get_tree().change_scene(filepath)
	var root = get_tree().get_root()
	var level = root.get_child(root.get_child_count() - 1)
	root.remove_child(level)
	level.call_deferred("free")

	var next_level_resource = load(filepath)
	var next_level = next_level_resource.instance()
	root.add_child(next_level)

func spawnFade(location):
	get_tree().get_current_scene().get_node("Player").SpawnLoc = location
	faded = true
	$fadeTimer.wait_time = fadetime
	$fadeTimer.start()
	ins.fadeTime = $fadeTimer.wait_time
	ins.alphaEnd = fadeA
	add_child(ins)
	

func _process(delta):
	if($fadeTimer.time_left==0&&faded):
		change()
