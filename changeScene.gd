extends Node


var fade = preload("res://transitions/fade.tscn")
var wipe = preload("res://transitions/wipe.tscn")
var ins = fade.instance()
var ins2 = wipe.instance()
export var location = ""
export var isWipe = false
export var fadetime = 0
export var fadeA = 0
var faded = false

export var nextLevel = ""
var filepath = ""
func _ready():
	filepath = "res://Levels/" + nextLevel + ".tscn"
	

func change():
	filepath = "res://Levels/" + nextLevel + ".tscn"
	#How Shane did it
	#get_tree().change_scene(filepath)

	#Doing it manually v1
	var tree = get_tree()
	var root = tree.get_root()
	var level = root.get_child(root.get_child_count() - 1)
	root.remove_child(level)
	level.call_deferred("free")

	var next_level_resource = load(filepath)
	var next_level = next_level_resource.instance()
	root.add_child(next_level)
	tree.set_current_scene(root.get_child(root.get_child_count() - 1))
	
	#We do all of that just to insert the spawn location into the player
	var player = next_level.get_node("Player")
	if player:
		player.SpawnLoc = location

func spawnFade():
	if(isWipe):
		spawnWipe()
	else:
		spfforty()


func spfforty():
	faded = true
	$fadeTimer.wait_time = fadetime
	$fadeTimer.start()
	ins.fadeTime = $fadeTimer.wait_time
	ins.alphaEnd = fadeA
	add_child(ins)
	
func spawnWipe():
	faded = true
	$fadeTimer.wait_time = fadetime
	$fadeTimer.start()
	ins2.fadeTime = $fadeTimer.wait_time
	ins2.endAlpha = fadeA
	add_child(ins2)

func _process(delta):
	if($fadeTimer.time_left==0&&faded):
		call_deferred("change")
